Return-Path: <linux-media+bounces-14442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7873A91D896
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B56B1C20DDC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 07:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4615E093;
	Mon,  1 Jul 2024 07:07:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93711B809
	for <linux-media@vger.kernel.org>; Mon,  1 Jul 2024 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719817677; cv=none; b=GB0UXGyyT7ANCsXOnUkMyELctbDqc1rBUmx9D3UL6l3W1vZwooRdpquqfiaMwuAz9NHmNKcDOxWt2GGvdRsadjcpwmhl6Ozd54G8STnhAgjS/vSJDHFrE8h+pncRWkGOcvSOaTBbRc+sS5RfDsTbIw8xdxM5+sIFSvRDKWhLOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719817677; c=relaxed/simple;
	bh=kU2FtVeYM5ALTBo95NncnAy6Vac2CPn/qKNLCZ/u5P8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWkvhKqmEzDCB/7TB/0eyvNyQwZ1Vuh7nnrFIpfXtMy6V9b+c3/TaSMEC6HLURWY5pmTVdRkzKIdnxz51Y4Jf6stZKpuGMh53NtXFsiiC6fde1VxU1/P+CAhHaKsIHsWtpwIzJJ73ea6E909JItBc/gZZahRxEs2Zv+jL+QbZd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1C9C116B1;
	Mon,  1 Jul 2024 07:07:56 +0000 (UTC)
Message-ID: <8ce4cb7b-d8c5-4825-80c4-4532af9bcc2a@xs4all.nl>
Date: Mon, 1 Jul 2024 09:07:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] v4l-utils: fix compilation with 64-bit time_t
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-media@vger.kernel.org
References: <20240610212316.136612-1-rosenp@gmail.com>
 <20240610212316.136612-2-rosenp@gmail.com>
 <2b52a504-c3b5-47cb-a962-c2bfa9063999@xs4all.nl>
 <CAKxU2N830Mk=iLKWxjbtok07Qggpv2wpdGk+XxkJyeAPV2cryw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <CAKxU2N830Mk=iLKWxjbtok07Qggpv2wpdGk+XxkJyeAPV2cryw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/06/2024 22:16, Rosen Penev wrote:
> On Sun, Jun 30, 2024 at 1:50 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> Hi Rosen,
>>
>> Apologies, I hadn't seen this patch, it was filed in my spam folder for some reason.
>>
>> On 10/06/2024 23:23, Rosen Penev wrote:
>>> musl since version 1.2.0 uses 64-bit time_t even on 32-bit. Cast to
>>> 64-bit for compatibility.
>>>
>>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
>>> ---
>>>  utils/cec-compliance/cec-compliance.cpp   |  3 ++-
>>>  utils/cec-compliance/cec-test-adapter.cpp |  5 +++--
>>>  utils/cec-ctl/cec-ctl.cpp                 | 19 ++++++++++---------
>>>  utils/cec-follower/cec-follower.cpp       |  3 ++-
>>>  utils/cec-follower/cec-processing.cpp     |  3 ++-
>>>  utils/keytable/keytable.c                 |  1 +
>>>  utils/libv4l2util/v4l2_driver.c           |  7 ++++---
>>>  utils/v4l2-tracer/retrace.cpp             |  2 +-
>>>  8 files changed, 25 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
>>> index 8075e1d6..df633a33 100644
>>> --- a/utils/cec-compliance/cec-compliance.cpp
>>> +++ b/utils/cec-compliance/cec-compliance.cpp
>>> @@ -3,6 +3,7 @@
>>>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>>   */
>>>
>>> +#include <cinttypes>
>>>  #include <sstream>
>>>
>>>  #include <fcntl.h>
>>> @@ -279,7 +280,7 @@ static std::string ts2s(__u64 ts)
>>>       t = res.tv_sec;
>>>       s = ctime(&t);
>>>       s = s.substr(0, s.length() - 6);
>>> -     sprintf(buf, "%03lu", res.tv_usec / 1000);
>>> +     sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
>>
>> This doesn't make sense: why is res.tv_usec cast to a uint64_t?
>> Is that field really a 64 bit value under musl? But in any case, tv_usec is
>> limited to 999999, so if it is a 64 bit value under musl, then just cast it
>> to unsigned long and leave the %03lu as-is.
> That's suseconds_t which is 64-bit. I felt it would be safer to cast
> to 64-bit, but OK.
>>
>> The commit log is certainly insufficient since a lot of the changes in this
>> patch have nothing to do with time_t but with tv_n/usec.
> include/alltypes.h.in:TYPEDEF _Int64 suseconds_t; : <-- from musl source.
>>
>> Why use PRIu64? That's not explained in the commit log either. I had to look
>> that up, as I've never seen it used before.
>>
>> As I understand it, musl doesn't support %llu in some cases? Looking at:
>>
>> https://github.com/cloudius-systems/musl/blob/master/include/inttypes.h
>>
>> it appears that PRIu64 can either be lu or llu. lu is used if UINTPTR_MAX == UINT64_MAX.
>>
>> But if that is needed, then I expect to see a single patch converting every
>> %lld and %llu in v4l-utils to use PRId/u64. Here it is only done for some
>> time-related code.
> not exactly. kernel types use long long always. musl switches between both.

Sorry, I don't follow. Do you mean that a __u64 will always be 64 bit and can
be formatted as %llu in musl? But types like suseconds_t can be either long or
long long?

Or do you mean something else?

I would really prefer to avoid the use of PRIu64, and if casts to (__u64) would
do that trick, than that sounds like an acceptable solution.

Regards,

	Hans

>>
>> Please don't mix changing to PRId/u64 with these time changes. If you believe
>> that is needed, then do that as a final patch for all of v4l-utils. But the
>> commit log should be very clear explaining why it is needed.
>>
>> Regards,
>>
>>         Hans
>>
>>>       return s + "." + buf;
>>>  }
>>>
>>> diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
>>> index 08c856af..7a80d17b 100644
>>> --- a/utils/cec-compliance/cec-test-adapter.cpp
>>> +++ b/utils/cec-compliance/cec-test-adapter.cpp
>>> @@ -4,6 +4,7 @@
>>>   */
>>>
>>>  #include <cerrno>
>>> +#include <cinttypes>
>>>  #include <ctime>
>>>  #include <string>
>>>
>>> @@ -1276,9 +1277,9 @@ static int testLostMsgs(struct node *node)
>>>                       printf("\t\tReceived messages: %d of which %d were CEC_MSG_CEC_VERSION\n",
>>>                              pending_rx_msgs, pending_rx_cec_version_msgs);
>>>               if (pending_quick_msgs < pending_msgs)
>>> -                     printf("\t\tReceived %d messages immediately, and %d over %ld seconds\n",
>>> +                     printf("\t\tReceived %d messages immediately, and %d over %" PRIu64 " seconds\n",
>>>                              pending_quick_msgs, pending_msgs - pending_quick_msgs,
>>> -                            time(nullptr) - start);
>>> +                            (uint64_t)time(nullptr) - start);
>>>       }
>>>       print_sfts(sft[1][1], "SFTs for repeating messages (>= 7)");
>>>       print_sfts(sft[1][0], "SFTs for repeating remote messages (>= 7)");
>>> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
>>> index 69aeb8cd..a2ffcb2b 100644
>>> --- a/utils/cec-ctl/cec-ctl.cpp
>>> +++ b/utils/cec-ctl/cec-ctl.cpp
>>> @@ -6,6 +6,7 @@
>>>  #include <algorithm>
>>>  #include <cctype>
>>>  #include <cerrno>
>>> +#include <cinttypes>
>>>  #include <cstring>
>>>  #include <ctime>
>>>  #include <map>
>>> @@ -416,7 +417,7 @@ std::string ts2s(__u64 ts)
>>>               strftime(buf, sizeof(buf), "%a %b %e %T.000000", &tm);
>>>       }
>>>       secs = last_secs + t - last_t;
>>> -     sprintf(buf + 14, "%02u:%02u.%06lu", secs / 60, secs % 60, res.tv_usec);
>>> +     sprintf(buf + 14, "%02u:%02u.%06d", secs / 60, secs % 60, (int)res.tv_usec);
>>>       return buf;
>>>  }
>>>
>>> @@ -944,10 +945,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
>>>               }
>>>               fprintf(fstore, "# cec-ctl --store-pin\n");
>>>               fprintf(fstore, "# version %d\n", CEC_CTL_VERSION);
>>> -             fprintf(fstore, "# start_monotonic %lu.%09lu\n",
>>> -                     start_monotonic.tv_sec, start_monotonic.tv_nsec);
>>> -             fprintf(fstore, "# start_timeofday %lu.%06lu\n",
>>> -                     start_timeofday.tv_sec, start_timeofday.tv_usec);
>>> +             fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRIu64 "\n",
>>> +                     (uint64_t)start_monotonic.tv_sec, (uint64_t)start_monotonic.tv_nsec);
>>> +             fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRIu64 "\n",
>>> +                     (uint64_t)start_timeofday.tv_sec, (uint64_t)start_timeofday.tv_usec);
>>>               fprintf(fstore, "# log_addr_mask 0x%04x\n", node.log_addr_mask);
>>>               fprintf(fstore, "# phys_addr %x.%x.%x.%x\n",
>>>                       cec_phys_addr_exp(node.phys_addr));
>>> @@ -986,10 +987,10 @@ static void monitor(const struct node &node, __u32 monitor_time, const char *sto
>>>                        */
>>>                       clock_gettime(CLOCK_MONOTONIC, &start_monotonic);
>>>                       gettimeofday(&start_timeofday, nullptr);
>>> -                     fprintf(fstore, "# start_monotonic %lu.%09lu\n",
>>> -                             start_monotonic.tv_sec, start_monotonic.tv_nsec);
>>> -                     fprintf(fstore, "# start_timeofday %lu.%06lu\n",
>>> -                             start_timeofday.tv_sec, start_timeofday.tv_usec);
>>> +                     fprintf(fstore, "# start_monotonic %" PRIu64 ".%09" PRIu64 "\n",
>>> +                             (uint64_t)start_monotonic.tv_sec, (uint64_t)start_monotonic.tv_nsec);
>>> +                     fprintf(fstore, "# start_timeofday %" PRIu64 ".%06" PRIu64 "\n",
>>> +                             (uint64_t)start_timeofday.tv_sec, (uint64_t)start_timeofday.tv_usec);
>>>                       fflush(fstore);
>>>                       start_minute = now;
>>>               }
>>> diff --git a/utils/cec-follower/cec-follower.cpp b/utils/cec-follower/cec-follower.cpp
>>> index a7481aea..9b29e3c6 100644
>>> --- a/utils/cec-follower/cec-follower.cpp
>>> +++ b/utils/cec-follower/cec-follower.cpp
>>> @@ -3,6 +3,7 @@
>>>   * Copyright 2016 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>>>   */
>>>
>>> +#include <cinttypes>
>>>  #include <cstring>
>>>  #include <ctime>
>>>  #include <sstream>
>>> @@ -354,7 +355,7 @@ void print_timers(struct node *node)
>>>                       printf("source: %s, ", source.c_str());
>>>                       if (t.recording_seq)
>>>                               printf("rec-seq: 0x%x, ", t.recording_seq);
>>> -                     printf("needs: %ld %s\n", t.duration, "MB."); /* 1MB per second. */
>>> +                     printf("needs: %" PRIu64 " %s\n", (uint64_t)t.duration, "MB."); /* 1MB per second. */
>>>               }
>>>               printf("Total media space available for recording: ");
>>>               if (node->state.media_space_available >= 0)
>>> diff --git a/utils/cec-follower/cec-processing.cpp b/utils/cec-follower/cec-processing.cpp
>>> index 3b5c3ce5..cc38f143 100644
>>> --- a/utils/cec-follower/cec-processing.cpp
>>> +++ b/utils/cec-follower/cec-processing.cpp
>>> @@ -6,6 +6,7 @@
>>>  #include "linux/compiler.h"
>>>
>>>  #include <cerrno>
>>> +#include <cinttypes>
>>>  #include <ctime>
>>>  #include <string>
>>>
>>> @@ -74,7 +75,7 @@ static std::string ts2s(__u64 ts, bool wallclock)
>>>       t = res.tv_sec;
>>>       s = ctime(&t);
>>>       s = s.substr(0, s.length() - 6);
>>> -     sprintf(buf, "%03lu", res.tv_usec / 1000);
>>> +     sprintf(buf, "%03" PRIu64, (uint64_t)res.tv_usec / 1000);
>>>       return s + "." + buf;
>>>  }
>>>
>>> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
>>> index a726921a..ba7c7c4d 100644
>>> --- a/utils/keytable/keytable.c
>>> +++ b/utils/keytable/keytable.c
>>> @@ -214,6 +214,7 @@ static enum sysfs_protocols parse_sysfs_protocol(const char *name, bool all_allo
>>>       return SYSFS_INVALID;
>>>  }
>>>
>>> +__attribute__((format(printf, 3, 0)))
>>>  static void write_sysfs_protocols(enum sysfs_protocols protocols, FILE *fp, const char *fmt)
>>>  {
>>>       const struct protocol_map_entry *pme;
>>> diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
>>> index 6b6366fa..5cd63fac 100644
>>> --- a/utils/libv4l2util/v4l2_driver.c
>>> +++ b/utils/libv4l2util/v4l2_driver.c
>>> @@ -15,6 +15,7 @@
>>>  #include <assert.h>
>>>  #include <errno.h>
>>>  #include <fcntl.h>
>>> +#include <inttypes.h>
>>>  #include <stdio.h>
>>>  #include <stdlib.h>
>>>  #include <string.h>
>>> @@ -174,13 +175,13 @@ static void prt_buf_info(char *name,struct v4l2_buffer *p)
>>>  {
>>>       struct v4l2_timecode *tc=&p->timecode;
>>>
>>> -     printf ("%s: %02ld:%02d:%02d.%08ld index=%d, type=%s, "
>>> +     printf ("%s: %02" PRIu64 ":%02d:%02d.%08" PRIu64 " index=%d, type=%s, "
>>>               "bytesused=%d, flags=0x%08x, "
>>>               "field=%s, sequence=%d, memory=%s, offset=0x%08x, length=%d\n",
>>> -             name, (p->timestamp.tv_sec/3600),
>>> +             name, (uint64_t)(p->timestamp.tv_sec/3600),
>>>               (int)(p->timestamp.tv_sec/60)%60,
>>>               (int)(p->timestamp.tv_sec%60),
>>> -             p->timestamp.tv_usec,
>>> +             (uint64_t)p->timestamp.tv_usec,
>>>               p->index,
>>>               prt_names(p->type,v4l2_type_names),
>>>               p->bytesused,p->flags,
>>> diff --git a/utils/v4l2-tracer/retrace.cpp b/utils/v4l2-tracer/retrace.cpp
>>> index 60d64d8b..010936c0 100644
>>> --- a/utils/v4l2-tracer/retrace.cpp
>>> +++ b/utils/v4l2-tracer/retrace.cpp
>>> @@ -72,7 +72,7 @@ void retrace_mmap(json_object *mmap_obj, bool is_mmap64)
>>>                                  (long) buf_address_retrace_pointer);
>>>
>>>       if (is_verbose() || (errno != 0)) {
>>> -             fprintf(stderr, "fd: %d, offset: %ld, ", fd_retrace, off);
>>> +             fprintf(stderr, "fd: %d, offset: %lld, ", fd_retrace, (long long)off);
>>>               if (is_mmap64)
>>>                       perror("mmap64");
>>>               else
>>


