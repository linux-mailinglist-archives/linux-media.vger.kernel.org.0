Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB6C632C7D7
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351793AbhCDAc4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:32:56 -0500
Received: from out2-40.antispamcloud.com ([185.201.17.40]:46822 "EHLO
        out2-40.antispamcloud.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381193AbhCCV34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Mar 2021 16:29:56 -0500
Received: from s114.servername.online ([204.44.192.29])
        by mx136.antispamcloud.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <gwarnusz@lectorprep.org>)
        id 1lHZ1l-000b6P-F5
        for linux-media@vger.kernel.org; Wed, 03 Mar 2021 22:27:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lectorprep.org; s=default; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:To:From:Date:MIME-Version:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FIuO+TSQlFLuNvfi//HlvYBi2uocJ6i+mHrss3CETUw=; b=tVKN14PC/TVKAi6Zy83pXKRoYI
        DcjY1cTwem1m7S2v/iu1gZtRGQOWIzvS4ZuFGyiuy23RMLMI26YHnc+2NfR0LqEw4Wzir9q1pdzXw
        HBiID8ifJmAoFfUSSFIUYMvec2lGgKjFeOkd7/qmBY/BpDkvUEoixGyVeoif8TvKAz9ZxcPbNxy9O
        w3VB54W8c0LiZ09RBzvFmsn6d9a/DsYOvfz27Mfe3TfVPDvTDJS/4BctY6h/KfRtVAwE0N1abnEy+
        iY1rLYOEENdyxG2P++DlWp19IcVxWjluZ7tU0k475IZ4Ul8WeBLO8CvjMAqNsTylNXMTBu8U3x9yF
        gdpwusdQ==;
Received: from localhost ([127.0.0.1]:56806 helo=s114.servername.online)
        by s114.servername.online with esmtpa (Exim 4.93)
        (envelope-from <gwarnusz@lectorprep.org>)
        id 1lHZ13-005dWi-7M
        for linux-media@vger.kernel.org; Wed, 03 Mar 2021 13:26:46 -0800
MIME-Version: 1.0
Date:   Wed, 03 Mar 2021 15:26:45 -0600
From:   Greg Warnusz <gwarnusz@lectorprep.org>
To:     linux-media@vger.kernel.org
Subject: Support for the Logitech Brio webcam?
In-Reply-To: <2d32b42777e171ebcc77a74c9a09caba@lectorprep.org>
References: <2d32b42777e171ebcc77a74c9a09caba@lectorprep.org>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <0db861b4ea8c69239ac0fd7955891ebe@lectorprep.org>
X-Sender: gwarnusz@lectorprep.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-OutGoing-Spam-Status: No, score=-1.0
X-Get-Message-Sender-Via: s114.servername.online: authenticated_id: gwarnusz@lectorprep.org
X-Authenticated-Sender: s114.servername.online: gwarnusz@lectorprep.org
X-AuthUser: gwarnusz@lectorprep.org
X-Originating-IP: 204.44.192.29
X-Spampanel-Domain: outgoing-shared.hostpapa.com
X-Spampanel-Username: outgoingshared
Authentication-Results: antispamcloud.com; auth=pass (login) smtp.auth=outgoingshared@outgoing-shared.hostpapa.com
X-Spampanel-Outgoing-Class: unsure
X-Spampanel-Outgoing-Evidence: Combined (0.15)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9WLQux0N3HQm8ltz8rnu+BPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xwY1jvqTi5EZr/+c8MLY+n7sSvgVJKSSRgWR/YKjxme6vp
 k7Vp2UXVHEQMIct0liI6NDTckWKcP1APPO0B0N9hswKQDamPN66SYe4XX4xmgLu+/Q+EGOe46wL6
 iWxH/Xbdu0u3CuVxcPNtSp18GVgWe4obggepWXyRrGYzhXmsfNwQiNfoTSfh0RDGKTkvDxGDwIE7
 VKe+bqpcdCns72R1fCJ2fu5SkY1N7SfTCXje8FkGmkkmkXBUxcWkbwA4DrhXQFOX0czP0M0FvfyK
 B99wBvBArgsBAmswsDg7The/D4skBLPnZRl1CS1mfhnNPDZpZZHt2sx3SpskijVFUJeJ7ZVcZ20v
 KiDu6LnR8m9k9VUOfMXv5a6okRmpSN2D7MTk6xV06FcgZkQoEFV+s1chVLvKs3jED+rkxy9HfVI3
 2P+TU3e0rv2i5tX/5w6O+ydWBb39uS1TjWG2Inx+Ts2Q3BuobEUGYgCIMPs/N+wKoF+3sCPHtYe0
 SE4DdeAR5hlbf0XifTH4c85mykx+8CPRhFNbrTbJFADkQldlhWV9I1HiX1+RwyLEx/PT65L+whle
 5S10FHDQLMw7J6FDq9AYAXPFh8feVvv89z43H25pu+VGv0uBlL9S97gXMgUlg3fBhnKjs4WiKcLG
 jj+fpj9YUcgZdOzladg/0vaIE/GiF/JnuqqtN/sW17e49r5QDo9cJYKAMBwX2icjkNUxFdTvBm9L
 RlOM+5HQrqym6G1CSv8mtVxrnxNMVa7tgwmBfwFBpmzdcRGDcHNULk5SAO0CQzw6N6QyZVJUNuT2
 rIyDCDyjXJLFVVZ8h2Mubjvq8q/rjuU3A3io6xJmD59iFVkby+Eb8M0PdCIiE3UNa/fdZ12w6Ap9
 iYUatwP8aAOG2v3DM8R1qvg8173ajhScmRRAa8Mrc8quJ4btPpt/2FLuFFYnpIMsltzuUYZVC+vq
 Q/rNVd9xQVzFFrv2FVrb855E+GdFjag2t+nf4qk/UVXVfaNcTLQtpepvK8Nt4SAKjj4=
X-Report-Abuse-To: spam@quarantine10.antispamcloud.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear open-sorcerers,

I run Ubuntu and would like to use the Logitech Brio. Most attractive is 
its selectable 3 fields-of-view.

Here's the manufacturer's own blurb about its other abilities:

Brio is a remarkable piece of technology that streams crystal-clear 
video with superb resolution, frame rate, color and detail, including 
autofocus and 5x HD zoom. Brio delivers 4K Ultra HD video at 30 fps, HD 
1080p at either 30 or 60 fps, and HD 720p at 30, 60 or an ultra-smooth 
90 fps for outstanding clarity, smoothness, and detail.

More info: 
https://www.logitech.com/en-us/products/webcams/brio-4k-hdr-webcam.960-001105.html?crid=34

At US$200, it's still popular, as evidenced by its sold-out status at 
many vendors.

Is there a chance that developers smarter than I can make this work, 
even with limited features, for Linux?

Thank you.

Greg Warnusz
Saint Louis, Missouri, USA

