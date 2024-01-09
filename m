Return-Path: <linux-media+bounces-3387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090A828427
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 11:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D701C23C28
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 10:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C90364CA;
	Tue,  9 Jan 2024 10:43:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBD336AE0
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 10:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A119BC433F1;
	Tue,  9 Jan 2024 10:43:08 +0000 (UTC)
Message-ID: <73b9fa71-20e3-4805-9feb-ef2692f4cb0a@xs4all.nl>
Date: Tue, 9 Jan 2024 11:43:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qv4l2 crashes if output device implements VIDIOC_ENUM_FRAMESIZES
To: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>,
 linux-media@vger.kernel.org
References: <59383033-924d-45fb-a44f-7c274bb44517@gpxsee.org>
Content-Language: en-US
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <59383033-924d-45fb-a44f-7c274bb44517@gpxsee.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Martin,

On 1/9/24 11:17, Martin Tůma wrote:
> Hi,
> If a driver implements VIDIOC_ENUM_FRAMESIZES for a output device, qv4l2 
> crashes in general-tab.cpp:2169 due to m_frameSize being 0. As all other 
> usages of m_frameSize in the GeneralTab::updateFrameSize() function are 
> guarded by "NULL checks" an obvious fix would be to guard the "addItem 
> while cycle" as well. But maybe a better solution would be to add the 
> frame size combobox to output devices as well. Or are the output devices 
> not supposed to have frame sizes enumeration?

You do not expect to see it for output devices. Those will typically use
VIDIOC_ENUMSTD or VIDIOC_ENUM_DV_TIMINGS. VIDIOC_ENUM_FRAMESIZES is something
that only makes sense for output devices if they do not support ENUMSTD or
ENUM_DV_TIMINGS, i.e. it has some very odd output hardware. In particular
vivid doesn't support this for the emulated video output.

I don't think v4l2-compliance has a check for this. I think it should at
least issue a warning if the video output devices supports ENUM_FRAMESIZES
and also ENUMSTD or ENUM_DV_TIMINGS.

In any case, qv4l2 shouldn't crash, so an initial fix should be to check
for m_frameSize being 0. A patch is welcome.

Which driver is this? I assume it is an out-of-tree driver, since I am
not aware of any mainline drivers that do this.

Regards,

	Hans

