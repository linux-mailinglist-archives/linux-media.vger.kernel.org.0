Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB1066BBA1
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 11:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbjAPKYD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 05:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjAPKYB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 05:24:01 -0500
X-Greylist: delayed 1078 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 02:24:00 PST
Received: from smtpq1.tb.mail.iss.as9143.net (smtpq1.tb.mail.iss.as9143.net [212.54.42.164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB8718AAC
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 02:24:00 -0800 (PST)
Received: from [212.54.42.106] (helo=smtp2.tb.mail.iss.as9143.net)
        by smtpq1.tb.mail.iss.as9143.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rudy@grumpydevil.homelinux.org>)
        id 1pHMNM-0007Pz-Nt
        for linux-media@vger.kernel.org; Mon, 16 Jan 2023 11:06:00 +0100
Received: from imail.office.romunt.nl ([217.63.22.158])
        by smtp2.tb.mail.iss.as9143.net with ESMTPA
        id HMMypYVenrOocHMNMpb8ZK; Mon, 16 Jan 2023 11:06:00 +0100
X-Env-Mailfrom: rudy@grumpydevil.homelinux.org
X-Env-Rcptto: linux-media@vger.kernel.org
X-SourceIP: 217.63.22.158
X-CNFS-Analysis: v=2.4 cv=SKKEFsjH c=1 sm=1 tr=0 ts=63c52188 cx=a_exe
 a=K8yjpyJtwLN9Y/90wpXtDw==:117 a=K8yjpyJtwLN9Y/90wpXtDw==:17
 a=IkcTkHD0fZMA:10 a=RvmDmJFTN0MA:10 a=VZaRRX5orF0V-of73P0A:9 a=QEXdDO2ut3YA:10
Received: from [192.168.30.70] (meriadoc.office.romunt.nl [192.168.30.70])
        by imail.office.romunt.nl (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 30GA5XMe011744;
        Mon, 16 Jan 2023 11:05:34 +0100
Message-ID: <485c3f3f-b523-8908-8a83-7e7321f96d0b@grumpydevil.homelinux.org>
Date:   Mon, 16 Jan 2023 11:05:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCHv2 00/16] staging/media: remove most deprecated drivers
To:     Corinna Vinschen <vinschen@redhat.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
References: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
Content-Language: en-US
From:   Rudy Zijlstra <rudy@grumpydevil.homelinux.org>
In-Reply-To: <Y8UepVxVuihu4Vjj@calimero.vinschen.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.7 at imail
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-CMAE-Envelope: MS4xfCrRAI+nfuyrHoby8U+NHSo5uoT3yuT67RR4WgApjEemX4chx8cLP8xA1NeQexEC6Yl7wHMz0ULEkEn+y5bmVTJP5EWeYP5w1i+w1V76IJuqT6381Y0q
 GMWOi2JHkd8OurJCRVdRPHBPRPfkmORHYVyp8ZWFQCoV3L302Z978u/kXL29ITtXEE/V4Mgoc3iy3Ee3AVqGWYVVuKOHxn06USE1mAG+uxHmCFzPoPe656RB
 2V4ZS30oj412tj9khtkaEcdsCppBC/Ifev1EkKryPHWQnRmymBqENgzRTNIJUi3+
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hans,



On 16-01-2023 10:53, Corinna Vinschen wrote:
> Hi Hans,
>
> I only learned about this yesterday, so I hope I'm not too late.
>
> Please don't do that.  You're about to remove working drivers used by a
> lot of people.
>
> If you remove them from the Linux kernel, you will leave *lots* of DVB-C
> and DVB-S card users behind.  They will update their TV recording
> machines to a newer system at one point and suddenly their ability to
> record from TV is gone forever.
>
> I'm personally affected by this as well.  We're using a machine with
> four Technotrend S2-3200 Budget DVB-S2 cards for TV recordings using
> the VDR package.  This card is apparently handled by the code under
> drivers/staging/media/deprecated/saa7146.

This being the case (from another user), should those drivers be deprecated?


Cheers


Rudy

