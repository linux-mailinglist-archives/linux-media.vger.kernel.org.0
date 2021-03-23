Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C5A345927
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 09:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhCWIAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 04:00:25 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60769 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229437AbhCWIAL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 04:00:11 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id ObxOluRW2UzyrObxRlOcqy; Tue, 23 Mar 2021 09:00:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1616486410; bh=tNn9Hb87sU2hBOaMKKO7KRjfFSxaHbGZVTb+ByWcDNU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MaJBK7UeM/8lPk8JpM1Kbo+ZT61FVz6i25s3D0CDFuV90O/KQRxwTASxvE/mu/5Vf
         9MD7Ee/bbeb8twzVed6eOBAykPCxC6W1ripm8bitz9K10p0H5lgXMrFBYaWUtHXH+M
         PL9edxBczZ/8OKag8leQ+Ir+g0jRJcwWRaMacsFfQyxp+L4oAwhE/Q0PMHsG5pxPOT
         d+7nNwiopKE+QnZ6Gl5Arm/y91eOOHy/bsoRRJXMlsuMXVAadaUENACD9PXxRZS2n8
         1F6GZLD/kxEUF/+oXp7IneUeBo+X0YufNUkaBSOskcb4QjR0wadFqPmKg3djJzBF/3
         1//dPyhbm8pbA==
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: Can you fix the remaining meson kernel-doc warnings?
Message-ID: <847e3b30-98f1-eebc-355d-0038fa1bbf2e@xs4all.nl>
Date:   Tue, 23 Mar 2021 09:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFehouA444KxSSGABd4JhlATMkUHvt89lgnJJsA/rkD0iJ4btf9dWXW4ME6GZkhAWQ70O12SqqIGCl49hX+V6oauocn6uGH36A57HsehgFe0BlMTaH+H
 wyBlweq3/3jay3D7Stzj/Gr5yAxv6rq4blMYe2wo1eRpy3yonMv3YW0hbLMWhIsXIb33i3cHRfd78LIXaLR8/+4cvmW7L/jDx8LBWtVCtI2EHVJ2v+zR3oAw
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Neil,

I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
reported by the daily build, but there are way too many, so this needs to be
fixed.

Can you take a look at the following meson warnings?

drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'core' not described in 'esparser_queue_eos'
drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'data' not described in 'esparser_queue_eos'
drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'len' not described in 'esparser_queue_eos'
drivers/staging/media/meson/vdec/esparser.h:28: warning: Function parameter or member 'work' not described in 'esparser_queue_all_src'
drivers/staging/media/meson/vdec/vdec_helpers.h:59: warning: Function parameter or member 'tc' not described in 'amvdec_add_ts'
drivers/staging/media/meson/vdec/vdec_helpers.h:59: warning: Function parameter or member 'flags' not described in 'amvdec_add_ts'
drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'vdec_hevcf_clk' not described in 'amvdec_core'
drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'vdev_dec' not described in 'amvdec_core'
drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'lock' not described in 'amvdec_core'
drivers/staging/media/meson/vdec/vdec.h:141: warning: Function parameter or member 'resume' not described in 'amvdec_codec_ops'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'lock' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'sequence_out' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'num_dst_bufs' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'changed_format' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'last_offset' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'wrap_count' not described in 'amvdec_session'
drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'fw_idx_to_vb2_idx' not described in 'amvdec_session'

Thanks!

	Hans
