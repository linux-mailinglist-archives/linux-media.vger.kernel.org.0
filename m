Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026AD356588
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 09:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346717AbhDGHhV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 03:37:21 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:34769 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349454AbhDGHhM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Apr 2021 03:37:12 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id U2kDlADF043ycU2kHlPYqA; Wed, 07 Apr 2021 09:37:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617781021; bh=4t8wMq1u4T8fO9b8Ofrn7PGodO6CU55/WpBbeI18PAs=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=m1TKv8lNcG0utIzW3g5vHF7pNI6NO/vFgpVdWM0HM3P8lY2pvLO5Q0/y1MfJJ35RV
         uq886vLhUWkY6V0E01f3AOtBYZdCL5MHSeMmmuHGbmpT5jgcN7ahuJn+yK2d1RlQem
         p1BZMH+DIV3sh8bCXe6qbOh2O947HtcNnsZKs7euwviE7eT0+39igngdFRbzhhxoJX
         WcB2bLV1iTxkD5yRojhsy3AnRQx4UYzo477eLkk53LIO7fWntQ8RHLrLx/kqMDZHu7
         r/G4OVHfKbqxx7thRbjFOqJrKLpq4W/rlcQe0pW1yPE/mCwfoDSIS3v0+2HkusPaAe
         3f5hqlqn06Kfw==
Subject: Re: Can you fix the remaining meson kernel-doc warnings?
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <847e3b30-98f1-eebc-355d-0038fa1bbf2e@xs4all.nl>
Message-ID: <032fc641-06b4-37a0-fe6c-d933b4fd7fd8@xs4all.nl>
Date:   Wed, 7 Apr 2021 09:36:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <847e3b30-98f1-eebc-355d-0038fa1bbf2e@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH8UhPqihf7aUSIzRNNOYlQTZAXjtlrWyJmeBURkFfRZinmLQ52FdauLbbz3MWBXc3om8Y8ZmH4l5HxMGpd3t4Pbq3I/U2gkFcO9sJxLKaCTLUBUqpqn
 gTPtCsqn38Lk2lBCGX845wbXuaWfeEXn0vaMwrpyjFQEFCO5GCVzuv8UwUAOOtk+C5BJWC5CsnchxsydmK0qmKwXLQ2rdu+ZKNRjx8AUCW6D4KwjTUpUA6+4
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/03/2021 09:00, Hans Verkuil wrote:
> Hi Neil,
> 
> I've been cleaning up kernel-doc warnings in driver headers. Any issues are now
> reported by the daily build, but there are way too many, so this needs to be
> fixed.
> 
> Can you take a look at the following meson warnings?

Ping!

	Hans

> 
> drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'core' not described in 'esparser_queue_eos'
> drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'data' not described in 'esparser_queue_eos'
> drivers/staging/media/meson/vdec/esparser.h:22: warning: Function parameter or member 'len' not described in 'esparser_queue_eos'
> drivers/staging/media/meson/vdec/esparser.h:28: warning: Function parameter or member 'work' not described in 'esparser_queue_all_src'
> drivers/staging/media/meson/vdec/vdec_helpers.h:59: warning: Function parameter or member 'tc' not described in 'amvdec_add_ts'
> drivers/staging/media/meson/vdec/vdec_helpers.h:59: warning: Function parameter or member 'flags' not described in 'amvdec_add_ts'
> drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'vdec_hevcf_clk' not described in 'amvdec_core'
> drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'vdev_dec' not described in 'amvdec_core'
> drivers/staging/media/meson/vdec/vdec.h:92: warning: Function parameter or member 'lock' not described in 'amvdec_core'
> drivers/staging/media/meson/vdec/vdec.h:141: warning: Function parameter or member 'resume' not described in 'amvdec_codec_ops'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'lock' not described in 'amvdec_session'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'sequence_out' not described in 'amvdec_session'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'num_dst_bufs' not described in 'amvdec_session'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'changed_format' not described in 'amvdec_session'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'last_offset' not described in 'amvdec_session'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'wrap_count' not described in 'amvdec_session'
> drivers/staging/media/meson/vdec/vdec.h:274: warning: Function parameter or member 'fw_idx_to_vb2_idx' not described in 'amvdec_session'
> 
> Thanks!
> 
> 	Hans
> 

