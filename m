Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7509A2306E5
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 11:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgG1Jsz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 05:48:55 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:43739 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728368AbgG1Jsz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 05:48:55 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 0ME7kqEDGuuXO0ME8kI7wv; Tue, 28 Jul 2020 11:48:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595929733; bh=F/R2I6D4OWGv2EpYENdKEVzgCxe8voM7JFf6ctmLeIs=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=Vn3bV0UfF6yajUPg+JtT45a1uZGcPxTFIILs0bEd5CPG5C1m+fykD8LLKFlT0RPJe
         J4+jIDMb2ewG/0vI5JE+S9xvmasIEtfVbPaOkk6m8NdFPUmn8wqttkf6ng8dRu5etV
         eb6wf0BQPGfUBdBustjQbLDv3uGrHs4x+IzJ/KIeNloXh5zl7McZyLWd5xNTbVH+ma
         jDQ05ek8jpQo/PjGg3gUHJuxPMPMeYDSX2YCPQ8uoFSp5TjJwOvvpxVEmqs5EfQFUw
         QoMPvp87YRvdM7ddR0zp9sKNiioCWJm1xnO9ouJ2p2587llqvreuCT6EnR2kyDkxA/
         AemEMwmK4woYg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [RFC PATCH 0/2] Add v4l2_ctrl_request_create()
Date:   Tue, 28 Jul 2020 11:48:49 +0200
Message-Id: <20200728094851.121933-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHzVj9eR94V8IN+XQnKBTLoYkSjzbT6H6XasTrh1RTJY3iucTWtJZyujAS+vnZI9E3dLHazurw3gRLu05k5INnO38/H6SiVdAwVT/yyfNEcfHWF+/wxF
 UxzB+4l3GC3vAMB1++uhbt+YcySSPiyYuj6XOn2Yhc6FSUkQosBoTREwGERtF0aSe3n0kIBtvKWoxbEG0tpoF/f1utfb3hfA7OwufiWATE57OQaoVm9wfWGK
 6vLlnuAg1Z2/cs59jhIkBtkhZW2RMhrldK+QFuK/n5nLGL6zzR/NjBYxIrmeL8dL
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Request API is missing a feature: if userspace did not set any controls,
then the request object will not contain a control object (that's created
only if the user sets a control in the request).

This is fine for e.g. stateless codecs since they require that each request
contains controls, so this is always done. And this is also the reason that
this hasn't been a problem before, since the Request API is almost exclusively
used by stateless codecs.

But for e.g. vivid this means that the completed request does not contain
any controls in the request containing the control values at the time that
the frame was captured (or output).

In addition, if a driver needs to set a status control, then that control
won't be part of the request either.

This RFC series adds a v4l2_ctrl_request_create() function that can be
called in the req_validate() callback of the request. If the request
doesn't contain a control object, then it will add a new one.

This is an RFC for now. Hopefully this will help Yunfei Dong with the
development of Read-Only Requests, since that should be a lot simpler with
this new function.

Also, I am not entirely happy with the name of the function and I also
think that we might need a helper in v4l2-common.c that combines with
function with vb2_request_validate(), thus avoiding that drivers need
to remember to call both v4l2_ctrl_request_create() and vb2_request_validate().

Regards,

	Hans

Hans Verkuil (2):
  v4l2-ctrls.c: add v4l2_ctrl_request_create
  vivid: call v4l2_ctrl_request_create()

 drivers/media/mc/mc-request.c                 |  3 +-
 drivers/media/test-drivers/vivid/vivid-core.c |  4 +++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 35 +++++++++++++++++++
 include/media/v4l2-ctrls.h                    | 16 +++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)

-- 
2.27.0

