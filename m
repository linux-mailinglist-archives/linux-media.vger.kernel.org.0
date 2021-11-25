Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1CBE45DC27
	for <lists+linux-media@lfdr.de>; Thu, 25 Nov 2021 15:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355528AbhKYOU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Nov 2021 09:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhKYOS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Nov 2021 09:18:28 -0500
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06731C0613F2
        for <linux-media@vger.kernel.org>; Thu, 25 Nov 2021 06:12:39 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id qFUIm7dSG1HGJqFUMm3RNn; Thu, 25 Nov 2021 15:12:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637849558; bh=IBkDS7fAbi/ISO0i7SHh68UYVuRrlOSqVmJb8BpwaO8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=g2F9SF1QKFGgM2IuMQ9SV8tezyl1NgSM0K125qWj8l6EcC2oZUGUGcL+8NykiW8nw
         nWVPK+6tYySWgJ4Ikr2k34LOsAwoenAQzhrYr1TflBiG66n5tGAuNSm7xtb3pYo4K0
         oYeK4jkRcY2xRf30N9lM8s+iSPwPzJKltKntOCnTqI5DVJ3vW9aLCy9zsLP7ZfhSmG
         WRbZaAb+8b+OqdTbssw9vErYcVHEVGDK4L/wUgRI84+E8eGBgGqea0t/3wHgisE5ai
         9onuAh+X4wm7lXnz816pFLMztY6rQ1n1qUn8Zjpit+7czHVpG3BdgoFylbctUiGU/I
         VJVYCMIUNnGqQ==
Subject: Re: [PATCH] v4l2-compliance: detect no-mmu systems
To:     Dillon Min <dillon.minfei@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <a348a21b-b069-19b5-2565-d70e3161f2b5@xs4all.nl>
 <CAL9mu0+nyYSKbq0TnaPk5j-mYYXF3efyp290N_WHdJOkNoFfsg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ce38e9c6-42b9-f08a-c6c3-2abc416df9e8@xs4all.nl>
Date:   Thu, 25 Nov 2021 15:12:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0+nyYSKbq0TnaPk5j-mYYXF3efyp290N_WHdJOkNoFfsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfM1WTeWiVCayDUrdlQ2j4th1QRIeEe9+Q/OxI7WRcATprrYFWKrEfisF5tGtscIHHRA+wFNFKydr7eBuV3YHJjM8o4Ln02IIGn8Hpc2FUPBUxaTDpBBK
 l/Fz59dZVSsB4SELSxBlyH2iwbug1r/0AI4C1RIymEMN8hdf6xXsto6Lci65J8rOelr1vuBv7kvNCW7s7ED68vgyDfIPcuwcRXYyI2vfgjmIMgvsGv4PNutF
 aL6svft2nOUUdLze7ua+UA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/11/2021 14:33, Dillon Min wrote:
> Hi Hans,
> 
> On Thu, 25 Nov 2021 at 21:14, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> Check if the OS has an MMU. If not, then skip tests that only work for
>> systems that have an MMU.
>>
>> The safest and most generic method I found is the FIONBIO ioctl that is
>> available for any file descriptor and is a write-only ioctl, so no memory
>> will be accidentally written. On a MMU system this will return EFAULT, and
>> on a ucLinux system this will return 0.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> Dillon, the original RFC patch (1) I posted to fix this in the kernel is not
>> the correct method. See:
>>
>> https://stackoverflow.com/questions/24755103/how-to-handle-null-pointer-argument-to-ioctl-system-call
> 
> Thanks for the detailed information.
> 
>>
>> So instead I try to detect if there is an MMU in v4l2-compliance and, if not,
>> just skip those tests that require an MMU.
>>
>> Can you test this patch?
> 
> Sure, I'll test it then update the result.

Note that v4l2-compliance should say at the top that it detects a no-MMU system:

>> @@ -152,8 +153,21 @@ static struct option long_options[] = {
>>
>>  static void print_sha()
>>  {
>> +       int fd = open("/dev/null", O_RDONLY);
>> +
>> +       if (fd >= 0) {
>> +               // FIONBIO is a write-only ioctl that takes an int argument that
>> +               // enables (!= 0) or disables (== 0) nonblocking mode of a fd.
>> +               //
>> +               // Passing a nullptr should return EFAULT on MMU capable machines,
>> +               // and it works if there is no MMU.
>> +               has_mmu = ioctl(fd, FIONBIO, nullptr);
>> +               close(fd);
>> +       }
>>         printf("v4l2-compliance %s%s, ", PACKAGE_VERSION, STRING(GIT_COMMIT_CNT));
>> -       printf("%zd bits, %zd-bit time_t\n", sizeof(void *) * 8, sizeof(time_t) * 8);
>> +       printf("%zd bits, %zd-bit time_t%s\n",
>> +              sizeof(void *) * 8, sizeof(time_t) * 8,
>> +              has_mmu ? "" : ", has no MMU");

                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Please verify that it actually does that. I hope it does :-)

Regards,

	Hans

>>         if (strlen(STRING(GIT_SHA)))
>>                 printf("v4l2-compliance SHA: %s %s\n",
>>                        STRING(GIT_SHA), STRING(GIT_COMMIT_DATE));
