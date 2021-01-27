Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7323058B9
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 11:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236169AbhA0Kqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 05:46:35 -0500
Received: from mout01.posteo.de ([185.67.36.65]:54980 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233992AbhA0Kpb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 05:45:31 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id A05BC160060
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 11:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1611744253; bh=OI2zse7fV2gal0e+4ZjQqMrJt47PLC6cp5evmSMqOYg=;
        h=To:Cc:From:Subject:Date:From;
        b=LpIOG0TkuY1NdjN8jY26A54pTW3iZSTe9IWmatLtYptMqIfNdG/0kuFwI12zDELIv
         oZCYCvJ7GbnjDJrp97jqgza1jSiEK6mjohJO07ilJ1JtpULWVv0gFHLwxCQH/GfcOS
         NEUjso8THYeB5I8hDXqQRrvIf1wSzZDRgyxd7WWEiF2Esgf+TKaFWtubx5zxwA34nZ
         VplPMqdm7V/Lc0R/0p2qoku3JRD2pQVVy05CVlIui4PPsboABi3T8tuVUA2Cpp4S9e
         9u/FDaRAzBmL5xoG0tkfYnDNwsffNgCx+Gz5ihNYQ49iqLyNgwIZdpMC9pcGjlHsRF
         MCK53YzzMilnw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4DQgFm489kz6tmT;
        Wed, 27 Jan 2021 11:44:12 +0100 (CET)
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
From:   Max Schulze <max.schulze@posteo.de>
Subject: v4l2-ctl: Question on last_ts
Message-ID: <de158cf3-5825-be21-f8ed-964cb9be6ec0@posteo.de>
Date:   Wed, 27 Jan 2021 11:44:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Hans,


I do not understand the concept on last_ts.

> cap dqbuf: 0 seq:      0 bytesused: 512000 ts: 137342.420951 delta 
> last: 137342420.951 ms (ts-monotonic, ts-src-soe)
> cap dqbuf: 1 seq:      2 bytesused: 512000 ts: 137342.484954 dropped: 
> 1 (ts-monotonic, ts-src-soe)

It seems to print the timestamp on the first frame, but then never again 
(how useful is it, to print the same timestamp twice?).


> if (last_ts <= 0.0)
>             fprintf(f, " delta last: %.03f ms", (ts - last_ts) * 1000.0);
>         last_ts = ts;

Might it be, that commit 222e1760c7 "utils: fix implicit float 
conversion" got the float conversion wrong and it should rather be

>         if (last_ts > 0.0)

To my understanding, this would yield a much-more useful output of 
printing the diff to the last frame _in every frame_


> cap dqbuf: 0 seq:      0 bytesused: 512000 ts: 143215.916971 
> (ts-monotonic, ts-src-soe)
> cap dqbuf: 1 seq:      2 bytesused: 512000 ts: 143215.984995 delta 
> last: 68.024 ms dropped: 1 (ts-monotonic, ts-src-soe)
> cap dqbuf: 2 seq:      3 bytesused: 512000 ts: 143216.016956 delta 
> last: 31.961 ms (ts-monotonic, ts-src-soe)
> cap dqbuf: 3 seq:      4 bytesused: 512000 ts: 143216.052981 delta 
> last: 36.025 ms (ts-monotonic, ts-src-soe)
> cap dqbuf: 0 seq:      5 bytesused: 512000 ts: 143216.088920 delta 
> last: 35.939 ms fps: 29.08 (ts-monotonic, ts-src-soe)

