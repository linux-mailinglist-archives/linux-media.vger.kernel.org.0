Return-Path: <linux-media+bounces-9222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D53838A3822
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 23:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913342836D5
	for <lists+linux-media@lfdr.de>; Fri, 12 Apr 2024 21:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A3F152181;
	Fri, 12 Apr 2024 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="Q9KYfFAS"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1E14BF9B
	for <linux-media@vger.kernel.org>; Fri, 12 Apr 2024 21:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712959155; cv=none; b=oajHqnSrMEh5EMZvtP8QeC9T7n/1FB154Hd8kHUI2c6puVSW0hyPtRbTrEItTHh+/Qgs5EnuVKskEQyX6xNBfHVzdI6x4In6irWR4Ta8BUyqoz3SMWl6Jowx8KeENFI80gOOUJQAgjBIUiGE9MJPAIQpdI9qw6ebaUOG4OhnplI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712959155; c=relaxed/simple;
	bh=hnHF4cUvQrUBfp8xvf2Ju2e3O69qrM5bpVfd/qWkuI4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=fDx7fl7MQfj+MklPM+M1ROSK9i1k4TjM70OLd6LI/HH9vEKjtk9xRFqzScfuj/5UecLPeeJ/c9F2vusFcXlX9AGcKo/6nJLB6f2Jt6dPcJMzWtAsDKMzzRRgbvrcFNLV8wll/AL7CejbsE0NWG2jUHdLhtQxm6JiRDuIVf0j+Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=Q9KYfFAS; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1712959148; x=1713563948; i=herdler@nurfuerspam.de;
	bh=DKEzjM8ktNaUojEi/Ccls4c2Et66kSFknzeTsSkP6wg=;
	h=X-UI-Sender-Class:Date:From:Subject:To:References:Cc:
	 In-Reply-To;
	b=Q9KYfFASKeXeyDqGqdOT5PoUNVb4rhQHGyzqHcxc81fFgY0pN1v1kJ52DWQs6FSg
	 0HNchL4Ma0nJYiJmHrFwZ9hLILj03vx5y69e7ZSClxYR7OkhmaeoSM27N8+E+4rbt
	 P4goVNnPt4ePS2iEJ1RB94LU/0LgjlbL7e6QkXtc/v0ue0ox4yWWhflkmn5KXO0GE
	 Kv0vgKXbQkj4e3h7CstqOa89YIkZt86ScpS8WYaj9QhARdyJp952INBQ11x6txGGf
	 3ge3td8tpe2DUYgBW+EWNlNY8aUOoGV89pna6K0L/XHxPvO1qWoCmlJncWJUWcW2k
	 O/3gaCsG06vJCVwR9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.113.191.40]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoRA-1s1QWz3PSY-00ErzX; Fri, 12
 Apr 2024 23:59:07 +0200
Message-ID: <cbe544f7-832e-4f48-a94f-cd9654e5b263@nurfuerspam.de>
Date: Fri, 12 Apr 2024 23:59:07 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Herdler <herdler@nurfuerspam.de>
Subject: Re: [PATCH 00/11] media: ttpci: make checkpatch happy
To: linux-media@vger.kernel.org
References: <20240328020522.50995-1-herdler@nurfuerspam.de>
 <fdd16aef-7feb-4de4-9d79-c9b682217a40@xs4all.nl>
Content-Language: de-DE
Cc: smoch@web.de, tmn505@gmail.com, vinschen@redhat.com
In-Reply-To: <fdd16aef-7feb-4de4-9d79-c9b682217a40@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sf8o8bGGqf4IbDkp6zzirWCEeSvKS0Z2+z9d/eEq1whsfwwbdIU
 pQ36SSveYDPslUhKDIsnDd2AS+I0Vpb1qmqg3Dqg7sX3BKIlmYIs//wb2DGGaj0h7LgFzOn
 HHrd6qM8waVHOZT0Jij+Btaib6JqEKe1p8UEKcSbXRSbjW6ZJzBeX+beStAjHOyJR8GAWaX
 i0TO6mMI4TK0hcJS2JDrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SchukiIHqgQ=;BnKTUe6zwpldWdS1NEnaQLpSRt0
 IqyHwfQARxr8leT5r380TLIQBDP7KQhQQsiZO4IRdJtDO3RZDPw1OGdjy9ttDVGLHRuLkMYAx
 4wdFSP+w0aXght765qYJTeSDUDpzZOU782L3qqtGywfedu2HcSAoR6qAKJ9dkH6d9nC5TgwT4
 sgFxBjlcEJx3nIU2xx0U9YOjik7/CT288isv48J/mlIOZW0YisVK2x/TDMAFbfTdyfuJIdbnf
 HpsjIAz8BTw6lQ4Y3OB06BR4i9d1y/luSQh3Cg1TpQzc5RUcQmv1S7kyIHtXwEwPTl5hxhFo6
 VPr43MDinXg56IZTvF4Ai/lV9cVCMBmrh3XlAxUoNW7DVYE7m81MqIwYWaH7JZoOwD2q27Jfh
 L2pXfeqrvSBqDFmyuAoyZH2ADsxN+VnLd23A7IHB+YXlf+/emGUBUSkINtp0ZMXNKSc+zR0Qn
 mf1huKfjDoVzxHdSKbtjRISVF4ojkyTovcWQPXz7J9WR+DpxBy339McYqxdKIm6IqMF3Ssniq
 WQ0Wnw3+gHF+v4oRJpQgs4XFEFbg2Enhdwbl2xAbpE3htaPP3IScKetPDiCKkQhu4OxSIKGrk
 NE+rtaer54TBPOdTleOPSkB3LHzqZZpaJVe0VRM4TWpsvdImuM3DEB3f1jfUzZHoOUplcgOsu
 s/vZ4PBFsM4zyuWZ0k4efOff6l8Ig64Yw3UInOFvbHkmLpBZoqsGpQvDw/Zbmj5QlOinpqDJN
 d1CLH5dIOm98XaKv4yGVaqRSXloV+BlZVOxEFua6Cmn4rC83eSqTLyg68oLYvkMeX3NNSBOE7
 RAt9cYN5fCwLPaTu77+1HBOabMYs2MukLKZZOH7BI/+Pc=

Hi Hans,

On 08/04/24 16:54, Hans Verkuil wrote:
> Hi Stefan,
>
> On 28/03/2024 03:05, Stefan Herdler wrote:
>> Hi Hans,
>>
>> last year I promised to take a look at the chackpatch warnings.
>> Well, it took a little longer then expected but here is the first resul=
t.
>>
>> This patchset should remove all chackpatch warnings and errors in the
>> ttpci budget driver(s) if applied completely.
>>
>> This is the first in a series of similar fixes for the SAA7146 related
>> drivers (at least that is my plan).
>> This first patchset is also a test for my whole tool chain. Please give
>> me some feedback if there is something, that could be improved next tim=
e.
>>
>> Initially I had planned to start with the AV7110 driver, but then decid=
ed
>> to start with this one, because it was the easiest one to fix. It didn'=
t
>> had any complicated issues and the list of warnings was one of the
>> shortest among the SAA7146 drivers.
>
> If I run 'checkpatch.pl --strict' over these patches, then reports sever=
al
> of these warnings about the subject line:

I have run 'checkpatch.pl' without the '--strict' option so far, from now
on I will incorporate it.

>
> WARNING: A patch subject line should describe the change not the tool th=
at found it

Checkpatch is right, something like "coding style fixes" would be more
appropriate.
>
> I think if you fix that and post a v2 (fixing 04/11 and dropping 11/11),
> then I can merge it.

That sounds good, it should be done pretty quick.

04/11 was indeed a mistake.
11/11 was only meant as proposal anyway.


Thank you for the review.
Regards,

Stefan


>
> Regards,
>
> 	Hans
>
>>
>> Regards
>> Stefan
>>
>>
>> Stefan Herdler (11):
>>   media: ttpci: checkpatch fixes: whitespace and newlines
>>   media: ttpci: checkpatch fixes: whitespace
>>   media: ttpci: checkpatch fixes: comments
>>   media: ttpci: checkpatch fixes: braces
>>   media: ttpci: checkpatch fixes: export_symbol
>>   media: ttpci: checkpatch fixes: assign_in_if
>>   media: ttpci: checkpatch fixes: trailing_statements
>>   media: ttpci: checkpatch fixes: constant_comparsation
>>   media: ttpci: checkpatch fixes: miscellaneous
>>   media: ttpci: checkpatch fixes: logging
>>   media: ttpci: checkpatch fixes: msleep
>>
>>  drivers/media/pci/ttpci/budget-av.c   | 574 +++++++++++++-------------
>>  drivers/media/pci/ttpci/budget-ci.c   | 501 +++++++++++-----------
>>  drivers/media/pci/ttpci/budget-core.c |  38 +-
>>  drivers/media/pci/ttpci/budget.c      | 170 ++++----
>>  drivers/media/pci/ttpci/budget.h      |  19 +-
>>  5 files changed, 658 insertions(+), 644 deletions(-)
>>
>> --
>> 2.34.0
>>
>>
>

