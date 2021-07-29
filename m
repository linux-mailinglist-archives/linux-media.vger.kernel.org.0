Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57403DA46C
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 15:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237554AbhG2Ngh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 09:36:37 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:48665 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237557AbhG2Ngf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 09:36:35 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 96D5mV4p4XTlc96D6mWuNA; Thu, 29 Jul 2021 15:36:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627565788; bh=v6HfW1vuUwl5IwP7UxH0ojDLkKh5TpoGh2pAbSzn+hM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=E2LOPm7Sm56IScTx5+VMJa9eCxEWRbuOknMzi2/d1TRczsCIfQpU3vyIUa8CCvfWh
         0QErHcc8aBLr+jrMZStg2w65fc8DYjUyVn6oPHgHe56EuLPh3K2LDlT2kZMnvhqo4O
         2AA+164D8a7hcWklQd4Mv16GAqI7KX62T+Ct1TaRqSYqNpFtZ9aoZCC9qJ2yJ1T1sk
         llXHEWI17f/yB2n9pBYPHWdCn+nyGtzTQQcqTYnNyc0wiBtt1GC76ENG2UsIEerIDo
         GBNtnHPpUN6fOoogAn/n6hXqtA27/99T7MMrRvuQfMHvLXH8/JaXZe1BP9i5EQ2r6f
         S6GJlWrC7OXTQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Subject: [PATCH 0/3] vb2: do not allow support_requests + min_buffers_needed
Date:   Thu, 29 Jul 2021 15:36:24 +0200
Message-Id: <20210729133627.1592672-1-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGO50jq3zq15EklNILRdBPqiw3bRBKS+KTHcK5dj5eI2gxDuY+hjCkw5SSO5mN490Q939bLx8p8FD5SUNfS8NVrDTi2JiqDDJMYKH1QZ+VTOXGbILlq8
 RG4j1C/sA6iK2rsLmCsjMWxHRRLpMtyE00+TFKsoDpregSTXXCdpw+aGQJHDIapUHDo/x2XM1cNrKhX9mAGV6i9ObqeQzizZXLhsj1NS06nTpfVDoPLf3smz
 0orjkP0pKusctbekkeX6jygpBdkX8geFF9+wx9b82cc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the vb2_queue field min_buffers_needed is non-zero, then only
allow that if support_requests is false. Otherwise when a request is
queued and vb2_core_qbuf is called, that function could fail if it
needs to call start_streaming(). There is no way for the request API
to propagate such an error back to userspace, and you really don't
want that either.

If this is ever needed, then an API extension is most likely needed.

Currently there are only two drivers that set this combination of
features: cedrus and vivid.

There is no reason for a non-zero min_buffers_needed in the cedrus
driver, so just drop that.

For the vivid driver a new module option was added that allows the
user to control whether requests are not supported, supported (default)
or required. In the latter two cases min_buffers_needed is set to 0
in the vivid driver.

I would appreciate if someone can verify that the cedrus patch doesn't
break anything since that has only been compile tested.

Regards,

	Hans

Hans Verkuil (3):
  cedrus: drop min_buffers_needed.
  vivid: add module option to set request support mode
  videobuf2-core: sanity checks for requests and qbuf

 .../media/common/videobuf2/videobuf2-core.c   | 23 ++++++++++++++++++-
 drivers/media/test-drivers/vivid/vivid-core.c | 14 +++++++++--
 .../staging/media/sunxi/cedrus/cedrus_video.c |  2 --
 3 files changed, 34 insertions(+), 5 deletions(-)

-- 
2.30.2

