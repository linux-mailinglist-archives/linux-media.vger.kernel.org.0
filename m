Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8176411F9A9
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:26:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfLOR0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 12:26:36 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41807 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726136AbfLOR0g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 12:26:36 -0500
Received: from [IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de]
 ([IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gXf4i0GgoapzpgXf6irRvs; Sun, 15 Dec 2019 18:26:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576430793; bh=SUZVUuwpAWRuZkrdpEC1iAwYbz4LNSppNQOWAVq1WJQ=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XZDASuRrbbxybBnADx/qFx0pZO/+9iM6N3bPyQ8t5x3rWVTMmNMAnYc7F2YTQA0Cr
         aCOHlIpnPOAvaEsUHayYkN1TsewmWmaHLvtEpWruzZKJJld5eVc6Jsw5spjmD15+7E
         vXz/Z0zmR/BsefuqD6qVH+meIHuDoXCyYwew5wgr8T96+g+/AiEcTczwvWb6kGODrJ
         EfIVv35qXbQ/ENhn9mnbV+FwKeCP0KDJnn4NRR0g8bEysW9jczQSBJQ1r760tJjm60
         +/g0B+8s3SW2bf47jIFVSjIYyQFvNu3TLYGwwhXgr33eTJsT0KFZMCzK4FoGcBt50U
         moxJX9lTHSAQA==
Subject: Re: [PATCH v5 6/8] media: v4l2-core: fix v4l2_buffer handling for
 time64 ABI
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        me@zv.io
References: <20191126161824.337724-1-arnd@arndb.de>
 <20191126161824.337724-7-arnd@arndb.de>
 <09c664fd-87fb-4fac-f104-9afbe7d33aa2@xs4all.nl>
 <CAK8P3a1TvFCJf8t9T1yOXjsp088s9dbEOKLVDPinfwJe2B-27g@mail.gmail.com>
 <81bb5da1-6b84-8473-4ada-c174f43bbae2@xs4all.nl>
 <0843718f-1391-3379-38be-41fa9558ea6d@xs4all.nl>
 <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <bfc18778-0777-ad49-619b-39e1b9b536f3@xs4all.nl>
Date:   Sun, 15 Dec 2019 18:26:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1-xLUn368Lajia1=2GEXa92srQ2s9wH--MrRHj+kSTtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNGfPPFMFknX7oh+AIE1t8DC5mbtoOwzZceJ6IVkKpfzDOWXpUxGqkQIpqfZxC08/fw7JO41Mhy0H2Tj0JDXUtpRI/aYKZ+EKffqFctn57JSjBf2IJ7t
 T05tpphemaOZluzAEr7aQ/Imm9v7j4gytr3sF6l+kXxiBKO5U1NOyYg/5VQpcM2L6mjmp1Z4RDndYyS88uqK28e7/4un0pEHCeQgWBfNu3rW1KAsWktclLf5
 ZDx4/cAmncCl9TnsD+9jOdP2SdjmhnirswrDs8uFwhyCVTu5bs47Df/ewp9u5VZCWOkXDkhPLdP7XCRWwmHPTDTtLcFE1W2ItBU33vpG11CaWI9RW/SmfeZN
 nfMO+boHS6RH3lP1qqby4Z41l2eoCDs4jT/fp3yXjWvTshv7sBrZa+A8sazICoULSYkpXUGb
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/14/19 10:44 PM, Arnd Bergmann wrote:
> On Sat, Dec 14, 2019 at 12:27 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 12/13/19 4:32 PM, Hans Verkuil wrote:
>>>>> I am unable to test with musl since v4l2-ctl and v4l2-compliance are C++ programs,
>>>>> and there doesn't appear to be an easy way to compile a C++ program with musl.
>>>>>
>>>>> If you happen to have a test environment where you can compile C++ with musl,
>>>>> then let me know and I can give instructions on how to run the compliance tests.
>>>>>
>>>>> If you can't test that, then I can merge this regardless, and hope for the best
>>>>> once the Y2038 fixes end up in glibc. But ideally I'd like to have this tested.
>>>>
>>>> I've heard good things about the prebuilt toolchains from http://musl.cc/.
>>>> These seems to come with a libstdc++, but I have not tried that myself.
>>>
>>> I'll see if I can give those a spin, but if I can't get it to work quickly,
>>> then I don't plan on spending much time on it.
>>
>> I managed to build v4l2-ctl/compliance with those toolchains, but they seem to be
>> still using a 32-bit time_t.
>>
>> Do I need to get a specific version or do something special?
> 
> My mistake: only musl-1.2.0 and up have 64-bit time_t, but this isn't released
> yet. According to https://wiki.musl-libc.org/roadmap.html, the release
> was planned
> for last month, no idea how long it will take.
> 
> It appears that a snapshot build at
> http://more.musl.cc/7.5.0/x86_64-linux-musl/i686-linux-musl-native.tgz
> is new enough to have 64-bit time_t (according to include/bits/alltypes.h),
> but this is a month old as well, so it may have known bugs.

Ah, great, that worked, after applying the patch below.

Both struct v4l2_buffer32 and v4l2_event32 need to be packed, otherwise you would
get an additional 4 bytes since the 64 bit compiler wants to align the 8 byte tv_secs
to an 8 byte boundary. But that's not what the i686 compiler does.

If I remember correctly, packed is only needed for CONFIG_X86_64.

With these changes (plus a bunch of fixes for v4l-utils) I was able to do full
compliance tests for 64-bit, 32-bit time32 under x86_64, 32-bit time64 under x86_64,
time32 under i686 and time64 under i686.

Arnd, if you can post a v6 with the previous fixes and this fix included, then
I'll make a pull request for this for kernel 5.6.

Regards,

	Hans


Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 3bbf47d950e0..c01492cf6160 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -492,7 +492,11 @@ struct v4l2_buffer32 {
 	__u32			length;
 	__u32			reserved2;
 	__s32			request_fd;
+#ifdef CONFIG_X86_64
+} __attribute__ ((packed));
+#else
 };
+#endif

 struct v4l2_buffer32_time32 {
 	__u32			index;
@@ -1280,7 +1284,7 @@ struct v4l2_event32 {
 	struct __kernel_timespec	timestamp;
 	__u32				id;
 	__u32				reserved[8];
-};
+} __attribute__ ((packed));

 struct v4l2_event32_time32 {
 	__u32				type;
