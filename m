Return-Path: <linux-media+bounces-24807-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605AA129E4
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 18:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E4333A3F71
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 17:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254301ADC6D;
	Wed, 15 Jan 2025 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/erVws4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC28624A7ED;
	Wed, 15 Jan 2025 17:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736962404; cv=none; b=V65ef28PPV97I0gWQNzvN0JozvDNb/nSyyydSAn7aVTQOzGikH1JLvlzf0ff6kDsAmfZx3infcMjSQcqAryfqmwADupVVapBeP11s7DRDCdJtUbIMKTzh0y5gAJs+6/S3KEphIP/M4plMSjMZhmGlHxReyBYdc1QhZJZcpH0UX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736962404; c=relaxed/simple;
	bh=+tzwEHLf8s85+zyGb/tLCAPn4b62D9uaY7uMidIF++E=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=uQVWsSCw/edIv6g9pXjPpej8E9u9i622DFeYv5YWk9aNd88F3T5RSvFkTKv0KSSNw3hAXpEXcCSgfQ0UXMDSEpVY93FI/45HxSZRiEICnWLxfPBpmHwGjnE64elrPFM8m4bEPrIxttygqOClinqblo8QBeRMTA4mQY3IBo1HuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/erVws4; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540218726d5so31820e87.2;
        Wed, 15 Jan 2025 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736962401; x=1737567201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tzwEHLf8s85+zyGb/tLCAPn4b62D9uaY7uMidIF++E=;
        b=R/erVws45qs1kaSV/ioa66LF7Dnja2lopxqkNAuc1yw+vC18Ei9M5cphX5xpSKOzVt
         aXVyLQ/cVFJZwwtB7heTezxJr+UbzfS/FeY46a9bUWcbHQ4VCqUVHVsZjtiAmYgspn7N
         5FtSCyknvhyvzm9TQwZP/iapXJYUZXa43PTO2s0PIVmZxMtghccC+Gs0ZHssiV/+vpbl
         LHFjOmrcLSENl2RR0bg8FjWQEpfEzfD4/JeWLnGR9tjdaku5tgpn7VVjYJySrXKrJMt1
         Wl7l3Y2iTMq4WWYHYEWRF2xJyCHHkZqbGV1OTTLB/UiEdOIPz6l40pAc+vmz8UL1YvkZ
         yIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962401; x=1737567201;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+tzwEHLf8s85+zyGb/tLCAPn4b62D9uaY7uMidIF++E=;
        b=dH0ISmbIm+VVm8RxE7qOA6/641yx7OjQrRCYlu+4Iz/L0UEWvVwjXtgYVOAGlqY8f0
         zqQQ2Q0K6fGjIng2qNAayY1BvG0mhWhieMnBkEqf2s/dJ5eu3h0KGbtQn3U/1Q6Rwa3I
         r2enkhTehWNj34i0SCqbEw7mCaN7l4nvXb3pFcKJ2kbzmh/4Ae8uX/YF3XmmeMD8uUwF
         2fmkUMIwirsJYYd9J15TflZHQFUrI9EGTluFLQxEMBGDtnS5cMFcMRNy2UPF5M71G/Ye
         b8BndciygXg+Cn1z4foOzo6T19Ho/wkslp0tulrzpLCWWrvxN+MmjhsYBuTJmp4OxtqY
         zgOA==
X-Forwarded-Encrypted: i=1; AJvYcCV02qKoaXEG1bdZPP1nMfdhqE877YgCZff9+uBDHFxAAmERol2RFVxUw0YNBa15J1FgLDmF5Lpe4DiChlg=@vger.kernel.org, AJvYcCXxacIlywrPxl1a9Z+QCGc42KLQmj/6dd9Hv2XYewGaNZ14dAFrCEmUDm8q9HIO9U1puEfOL503ChjR8oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFEFA8KIRquyv50LpmgHReQhiVBunyQUMj4m96uE8BvSXChiQ3
	YxkjrAU9DlY79OhQ8uoMvlXfAqrIAVKg/DwE/qPU+fcKoiD4VTBFg5cCkCe7
X-Gm-Gg: ASbGnctrXVPVDLHgwbNhLSQ4vzMH+6IXZ4JgknSDBkHhvuejb5QlEhwKVG1pyJdaMc1
	LikKMIjN+a7n9dW/zlm5lzHpZ8mJJI/zZtkQnrE+eSpfdvyjon3aincSTN2ZXNFHvgaGTzPtzqh
	WoaLhjeM3p38nsPD3YjGOrS9/7xzHI1lcQf+gHKbZrSREx4Nn2W3XR/L0T6iLeRyHRCOSFWDF8W
	7Zep+4MAWO8krJ7BvAaxrJOnZ4ZtETDvTQT5BzC9n1FgNVQtdQz456Jvi0spJPHzTs+LIVgqiKP
	SnNhS72oBABuc20N2cQQXARt5XC3dDrFt5Z5JZLjKbpi
X-Google-Smtp-Source: AGHT+IHVuITnk6uWqJC7r+dQL/h3YFb1nzsnse5J2mvy5M+/MKpOzVH47aIYncz/G8LBHPMH6ccR4w==
X-Received: by 2002:a05:6512:2246:b0:540:1e7e:ca80 with SMTP id 2adb3069b0e04-542845d35d9mr9465671e87.30.1736962400482;
        Wed, 15 Jan 2025 09:33:20 -0800 (PST)
Received: from razdolb (static.248.157.217.95.clients.your-server.de. [95.217.157.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becbc25sm2051761e87.259.2025.01.15.09.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:33:19 -0800 (PST)
References: <20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com>
 <20250103152326.GP554@pendragon.ideasonboard.com>
 <87bjw9s4s3.fsf@gmail.com>
 <CAAFQd5ACseSBg4WZnUnbtwh+i63xcKMBFKnfc4_Aqfmnz0s=7A@mail.gmail.com>
 <877c6wryqn.fsf@gmail.com>
 <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
User-agent: mu4e 1.10.9; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dafna Hirschfeld
 <dafna@fastmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rkisp1: allow non-coherent video capture buffers
Date: Wed, 15 Jan 2025 20:29:58 +0300
In-reply-to: <CAAFQd5C89M1TtpaCoK56Jd2Kq+h6+z552KY6cAqiDjMjDCFdWQ@mail.gmail.com>
Message-ID: <87y0zcq8wy.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 2025-01-15 at 23:46 +09, Tomasz Figa <tfiga@chromium.org> wrote:

> On Wed, Jan 15, 2025 at 10:30=E2=80=AFPM Mikhail Rudenko <mike.rudenko@gm=
ail.com> wrote:
>>
>> Hi Tomasz,
>>
>> On 2025-01-15 at 17:31 +09, Tomasz Figa <tfiga@chromium.org> wrote:
>>
>> > Hi Mikhail and Laurent,
>> >
>> > On Wed, Jan 15, 2025 at 2:07=E2=80=AFAM Mikhail Rudenko <mike.rudenko@=
gmail.com> wrote:
>> >>
>> >>
>> >> Hi Laurent,
>> >>
>> >> On 2025-01-03 at 17:23 +02, Laurent Pinchart <laurent.pinchart@ideaso=
nboard.com> wrote:
>> >>
>> >> > On Thu, Jan 02, 2025 at 06:35:00PM +0300, Mikhail Rudenko wrote:
>> >> >> Currently, the rkisp1 driver always uses coherent DMA allocations =
for
>> >> >> video capture buffers. However, on some platforms, using non-coher=
ent
>> >> >> buffers can improve performance, especially when CPU processing of
>> >> >> MMAP'ed video buffers is required.
>> >> >>
>> >> >> For example, on the Rockchip RK3399 running at maximum CPU frequen=
cy,
>> >> >> the time to memcpy a frame from a 1280x720 XRGB32 MMAP'ed buffer t=
o a
>> >> >> malloc'ed userspace buffer decreases from 7.7 ms to 1.1 ms when us=
ing
>> >> >> non-coherent DMA allocation. CPU usage also decreases accordingly.
>> >> >
>> >> > What's the time taken by the cache management operations ?
>> >>
>> >> Sorry for the late reply, your question turned out a little more
>> >> interesting than I expected initially. :)
>> >>
>> >> When capturing using Yavta with MMAP buffers under the conditions men=
tioned
>> >> in the commit message, ftrace gives 437.6 +- 1.1 us for
>> >> dma_sync_sgtable_for_cpu and 409 +- 14 us for
>> >> dma_sync_sgtable_for_device. Thus, it looks like using non-coherent
>> >> buffers in this case is more CPU-efficient even when considering cache
>> >> management overhead.
>> >>
>> >> When trying to do the same measurements with libcamera, I failed. In a
>> >> typical libcamera use case when MMAP buffers are allocated from a
>> >> device, exported as dmabufs and then used for capture on the same dev=
ice
>> >> with DMABUF memory type, cache management in kernel is skipped [1]
>> >> [2]. Also, vb2_dc_dmabuf_ops_{begin,end}_cpu_access are no-ops [3], so
>> >> DMA_BUF_IOCTL_SYNC from userspace does not work either.
>> >
>> > Oops, so I believe this is a bug. When an MMAP buffer is allocated in
>> > the non-coherent mode, those ops should perform proper cache
>> > maintenance.
>>
>> Thanks for pointing this out!
>>
>> > Let me send a patch to fix this in a couple of days unless someone
>> > does it earlier.
>>
>> Now that we know that this is a bug, not an API misuse from my side, I
>> can fix this myself and send a v2. Would this be okay for you?
>
> I'd be more than happy :)

Done, see [1]. A review would be appreciated. :)

[1] https://lore.kernel.org/all/20250115-b4-rkisp-noncoherent-v2-0-0853e1a2=
4012@gmail.com/


--
Best regards,
Mikhail Rudenko

