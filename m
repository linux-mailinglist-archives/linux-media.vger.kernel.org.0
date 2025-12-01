Return-Path: <linux-media+bounces-47906-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B5C959BE
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 03:43:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5AFE4E07AB
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 02:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A301A08DB;
	Mon,  1 Dec 2025 02:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgH4KlaU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4792032D;
	Mon,  1 Dec 2025 02:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764556999; cv=none; b=nMNkOMaVDN2GHlMJql5eXP8bpnzL8n4wa5ga1n+gnd1kkIZDSWwk8B7aom4xiUf9+lcPuoKaY8e5GZmE45WgloUTuLeUxX1ji9iHsgzJO6X7CKt7JnzMRVz2qkhVdGKFuFeRIbxMJOLvb+oGqwfeyRzuJhcoP3GAf49BaIzUGJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764556999; c=relaxed/simple;
	bh=UXUNNJ8fVZIaUx+gZGmSjfEQppJSD5hXQrejrxMxJNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VXaMVtpU4979re5So6/znhbR6GFFCOHWxsz2+IeYaDeg70XSRt3iTxvJJwhI8PelTlxfzWiG8Z5kszjcKk3tY0yxlthZcH39/+KPblH+sh+peFNfSY9BYwmp8jBGLlFo/rXoyRgOVkL+zn0miX3kgVdK2V7FM9WS1yPzl5++SWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgH4KlaU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E812AC4CEFB;
	Mon,  1 Dec 2025 02:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764556998;
	bh=UXUNNJ8fVZIaUx+gZGmSjfEQppJSD5hXQrejrxMxJNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YgH4KlaUU8p2H0/dFXi0sgyvelj3km81a+g6zN833WjWCSVnIvJXY2bKHepQLFYcU
	 75s4VBSgeIzhYeKp2oM7espFz3dbCs22wxsuTKgMbE1cLJwkwFJ7PgcS0//PZzZFUK
	 8A5JH2enoqSJ6zwNEZYVXhQgK0FmHey/OkJs2A6cIBHihZBamYjbvwQRAP1RVTQ0L/
	 bZ4C60tSeJcrGxl4TzpZD3KLrPN7JEXgLlRQP6cF1xqS1UePi86RhdeA0wUdwtaZxh
	 dNpNF/O/gMyrv5RbkC0SigH0LtKfonh38OnOYCAU8rHnv66GOrV+EinEJ+vnm6yg1H
	 6iE6F7bQk499A==
Message-ID: <3a671359-b05a-4d58-84ca-f29385088e5c@kernel.org>
Date: Sun, 30 Nov 2025 20:43:15 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add AMD ISP4 driver
To: Sashank Karri <sashank.karri@gmail.com>, bin.du@amd.com
Cc: Dominic.Antony@amd.com, Phil.Jawich@amd.com, anson.tsao@amd.com,
 benjamin.chan@amd.com, bryan.odonoghue@linaro.org,
 gjorgji.rosikopulos@amd.com, hverkuil@xs4all.nl, king.li@amd.com,
 laurent.pinchart+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mario.limonciello@amd.com, mchehab@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, pratap.nirujogi@amd.com,
 richard.gong@amd.com, sakari.ailus@linux.intel.com, sultan@kerneltoast.com,
 "Adam J. Sypniewski" <ajsyp@syptech.net>
References: <CAL3XFnZ3XatQkR2HXpyfT6BK7bCjjGcaS5LjtK0DxPfHX0Q-dg@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
X-Enigmail-Draft-Status: N11222
Autocrypt: addr=superm1@gmail.com; keydata=
 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
In-Reply-To: <CAL3XFnZ3XatQkR2HXpyfT6BK7bCjjGcaS5LjtK0DxPfHX0Q-dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+ "Adam J. Sypniewski" <ajsyp@syptech.net>

On 11/28/25 9:12 PM, Sashank Karri wrote:
> Dear Bin,
> 
> I apologize if this is the wrong place to ask this question and
> suggest this very slight edit if I understand how ISP4 on the Ryzen AI
> Max+ 300 series SoCs works.  So the ASUS Rog Flow Z13 2025 also uses
> the same Strix Halo chips, albeit using the non-PRO series.  On the
> Windows side, the 13MP sensor, also from Omnivision, requires an AMD
> Camera Driver, something speciifcally also required by the  5.2 MP
> camera on the HP ZBook Ultra G1a.  So if both MIPI-capable cameras use
> the ISP4 technology on the Strix Halo SoC (do they?), this Linux ISP4
> driver should apply to both cameras, right? If so, shouldn't the ACPI
> ID for the 13MP sensor also be hardcoded into this code
> 
>> drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
> 
> Adam J. Sypniewski suggested hardcoding the ACPI ID into the I2C
> driver here to have the 13MP camera to work (the ASUS specific ACPI ID
> for the sensor can be found here):
> https://lore.kernel.org/lkml/aPeqy11m-TxwbzJV@garrus/

Two things:

1) Does this work?  I wouldn't expect it's enough to make everything 
work 100%.

2) AFAICT the Flow Z13 has a USB camera for the front camera, but the 
rear camera is the one that uses the ISP4.

So I'm confused by the commit message saying that the front facing 
camera needs it.  Is that a mistake?

> 
> I'm entirely new to the Linux kernel mailing list and very unfamiliar
> with webcam interfaces and how ASUS has chosen to interface the 13 MP
> sensor with the system, but I can confirm that it does not work yet in
> the Linux desktop, so I was wondering if the work on this new driver
> is necessary to get it to work.
> 
> Sashank
> 

I think it's going to be a bit more than just an ACPI ID the ISP4 driver 
though to enable it however.  amdgpu has a list of sensors that it 
supports (you can see isp_v4_1_1.c for details).  This currently only 
will recognize and configure the GPIOs for ACPI _HID OMNI5C10.

For ACPI _HID OMNI13B1 a new entry would be needed there along with the 
correct GPIO tables that match.  This will wire up the pinctrl-amdisp 
driver to have the right GPIOs.

Bin and Pratap can comment more on the feasibility.  But for now I think 
we should treat this as TODO for after the initial series lands with 
support for the sensor in the HP ZBook Ultra G1a.

