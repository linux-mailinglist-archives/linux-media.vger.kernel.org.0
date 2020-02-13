Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1F4715B9F4
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 08:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgBMHQ4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 02:16:56 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58913 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726657AbgBMHQz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 02:16:55 -0500
Received: from [IPv6:2001:983:e9a7:1:517b:ad10:523d:fa83]
 ([IPv6:2001:983:e9a7:1:517b:ad10:523d:fa83])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 28k0j9t9m8i4328k1jLLJX; Thu, 13 Feb 2020 08:16:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1581578213; bh=CfcaCyBMsbA1TdhYaSMaj2xl1A/+xyNtJtYam9gKXlM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i/6bUq0P2gaAJ5ld/Kj9i9dKnyrOsjl0WQiSyCVoJG4ndfFQy2GS0K4chk2S8e7wj
         G9TQTIESrrTPxyeFm3OpijFW/pmZoDhv6wKYH+IePyfPLXwGhk/nfpelOSciT32+f+
         wGMuI5zZGNUF0S1lhkskFdrlDgTSQ7IbwejVfeOYy8rYQBTGVOqu1NoTGVbFtd2yVQ
         +Y4shyTFzlDt6XLSDRAzrv81IGFq8le1Cx+In6Ay/nOswR0SQ715zOvEox3YBvUnH+
         H+W6kLLtOwuMDrWhAsIv0EzIRGBdtKTO6bbElTA+z1U+xNYJA0H7X4kK5C4EHN46cQ
         +fyhzwkR1MObw==
Subject: Re: [PATCH 1/2] edid-decode: add function to enable usage as a
 library
To:     Ilia Mirkin <imirkin@alum.mit.edu>
Cc:     linux-media@vger.kernel.org
References: <20200209174937.22844-1-imirkin@alum.mit.edu>
 <20200209174937.22844-2-imirkin@alum.mit.edu>
 <3e56402b-9841-99a3-730c-b1fd2bc2cc5d@xs4all.nl>
 <CAKb7Uvj2XV0+tr48EetVE1e_Vqpr-2zQCnR7NCWagWnbCEcyeQ@mail.gmail.com>
 <CAKb7Uvh7XGK+y5rXdFVSA+JkYYNW7Pp1P1=0x0Yy6L0hgv0Rhg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <ec351151-42c8-a9a5-7670-2208fd4fc106@xs4all.nl>
Date:   Thu, 13 Feb 2020 08:16:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAKb7Uvh7XGK+y5rXdFVSA+JkYYNW7Pp1P1=0x0Yy6L0hgv0Rhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLKufvW3Ewfb+3ahItvsB/G6Mgsd0YVMv5SPyYL7ZRUCjOneQfysfkAfW3gyh26GgAVISvmd173ev1JMmhkmNSP1UX7WMrFX4dqCK2qfBiEiYbboepKS
 ll09xfe3flUB+50yLHFlyESqgnOf6jqvtyPyYr6K65Eygo87PLjRwoq9vUxVL+IN9BxjT2CxrpeH06/uiDRlxzHK/0XeFNcY9gYSPZqcGHKjByQ2BtlB5VRt
 Gdh2xBSoKN7YQkzBR5KkZD0e7KQnfOn0I+zg0D5dI4cZ0KjfMCIqks0YVdi+/KPh+pubxGTFyyP71+3wADATVA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/13/20 1:48 AM, Ilia Mirkin wrote:
> On Mon, Feb 10, 2020 at 9:58 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>> On Mon, Feb 10, 2020 at 6:23 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>>> +     for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
>>>> +             s_msgs[i][0].clear();
>>>> +             s_msgs[i][1].clear();
>>>> +     }
>>>
>>> I'm pretty sure that this for loop is not necessary. Can you drop this
>>> for loop and see if it works?
>>
>> The current code has:
>>
>> static void show_msgs(bool is_warn)
>> {
>>   printf("\n%s:\n\n", is_warn ? "Warnings" : "Failures");
>>   for (unsigned i = 0; i < state.num_blocks; i++) {
>>     if (s_msgs[i][is_warn].empty())
>>       continue;
>>     print-the-error
>>
>> What would prevent an error from a previous run to appear without an
>> explicit clearing of s_msgs?
> 
> Hi Hans,
> 
> Do you agree with my assessment above?
> 
>   -ilia
> 

You are right, sorry. I should have checked the actual code instead of
relying on my obviously faulty memory.

Regards,

	Hans
