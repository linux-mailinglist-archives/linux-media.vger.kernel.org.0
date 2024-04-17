Return-Path: <linux-media+bounces-9656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874518A7E62
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 10:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B954F1C20B20
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 08:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6247FBA5;
	Wed, 17 Apr 2024 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="eYds2ytt"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EFF5D8F6
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713342908; cv=pass; b=M7rTvz57jC3Uyv3PZ3v+c035ljVL6heylq7tGXGO9eJk3TXHZQS4ZVobIBfSO/lIH3PVPbaTV2Ke90PEd/RYPqcNwWpcoDwf3YT9FNeunNLFVMR9wmWw4h4XNx7YPZKnCxetjIldQ1didmkxQFbXkdGtjwjELlk28grc31TJb7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713342908; c=relaxed/simple;
	bh=LOAgRqAAGqxIqPAVGQH/zSsPClnZehe4aTctmRcSlDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0Sb2SE2L0jakL4t/bVcdJYK7PEOAoBrnoI6tyQo9OZkYUSS+GkSuv7TqmF6fGUrOtjUZmIQfFxhiBSF0nKV2qkqbR842DhNXIp24LAH5AcX2T6XjYbfTn4K91HKPhc8N7SPAtF2Z6nDGR5DRFf+B0MF5l10qU3c3Cs9i/oxskU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=eYds2ytt; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VKDjr3stVz49Pyv;
	Wed, 17 Apr 2024 11:34:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1713342897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AY6j200ddeStulHb0vj3cgnXp8j4gEeBcRXeTlbek80=;
	b=eYds2yttuS2nhCoTw5T+KwVuD/RFuMFx5Kjz8bvAD/9sF3q76bwVPDkcWqq7r0coY0zF1+
	DK5j9ldK8kKccC5ljod3a6mSAfzeJuXaJaa8RPuY031a2kpYvGbZr0XHkKZJqEp6/u0KD2
	Mm6MA4uXxF8E0GuH6lQ3oILvLGhdw6s/6WjOb6o7wF0WFqD8MAW4B/0oLP7mc+c5RmS1pB
	p7vSGlndSwMbPg+KjMSmfZLNSMoxR+sK4Py7OmoWk6HPOuVI2yPREnFcnlHrq8vCnUujxe
	O7VZVRICO2Qpwz6iqzlWaI+OKezz98sjzuSrYsYuPqa/RbAVvXPK7P4Wt3bpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1713342897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AY6j200ddeStulHb0vj3cgnXp8j4gEeBcRXeTlbek80=;
	b=rpUi9zx+0O3whdgBQ7fszUMEQgZiE6Zv8BPXD+WuvTnqpZT7s1KkSSUMeeJTXpFGNhB9UK
	9sv37+vmKV+z0IpLzdPY2/6JCcTzCS36QRX3JoJ8tXYrMVqnASseR+cU0L2gGm3xmO/g4m
	gPLxjgy+e8N+s6d2WZezHdqWg4fMxZSxTxparxkxQA5TzTuPseJ+j09x3iw3pEnil7BPH2
	kZGVu+5BIyttjoMNZ5ALMssBz6FNe2VP2IrdJJSRX9noo4v/ylyK18myj0GMWsP3BVAYmG
	ki3AwxGca82cDqYQlAn12Wx5qAstMAa5rWDWcHrvhH+AXI9Kyd2eiWsI5W9Ozg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1713342897; a=rsa-sha256;
	cv=none;
	b=XUmyKSu6pxQn8h9tm62nQMkQcn5azyKtiDdaNvhq2xjXUOECGtB8Qiw1QGgZxZHEEibqhz
	AyIdDy9kAxLQHD8r7BEQjHxGq0BcPF5j3I8YH8ok3Y/32P2pSCayYolniqS2DAlKO3xkd+
	EPReLPnmwSwPW6SPaz1HTPsP45o8h50XX9TMHq+9gDthx8BnGKbYIWb17UrNzHbaQa2rh8
	1yQ5MfOiahJs3CVoF3ZXvgZ9RssKoi7KziCiH19ww/3zyMtFu8mEoWdblMkMV+cDMVl4mo
	PNV+90bReI55tF7+151Rnu6nIeHi1bdjNFP23DvnCgJ8YaScPPOaIjdD2RC/rQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6ACD1634C97;
	Wed, 17 Apr 2024 11:34:55 +0300 (EEST)
Date: Wed, 17 Apr 2024 08:34:55 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans de Goede <hans@hansg.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com, tfiga@chromium.org,
	senozhatsky@chromium.org, andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com, tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
Message-ID: <Zh-Jr2gfdoCeB5-4@valkosipuli.retiisi.eu>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
 <77c32f87-cdec-4dd0-85b8-c75ca7405438@hansg.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77c32f87-cdec-4dd0-85b8-c75ca7405438@hansg.org>

Hi Hans,

On Wed, Apr 17, 2024 at 09:56:40AM +0200, Hans de Goede wrote:
> Hi Sakari,
> On 4/16/24 10:10 PM, Sakari Ailus wrote:
> > Hello everyone,
> > 
> > This patch series adds a driver for Intel IPU6 input system.
> > IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> > device which can be found in some Intel Client Platforms. User can use
> > IPU6 to capture images from MIPI camera sensors.
> > 
> > IPU6 has its own firmware which exposes ABIs to driver, and communicates
> > with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> > the driver sets up a page table to allow IPU6 DMA to access the system
> > memory.
> > 
> > IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> > 
> > I can now capture images from ov01a10 and ov2740 sensors (including
> > metadata from the latter).
> > 
> > The series applies on top of the metadata patchset
> > <URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.
> 
> Thank you for the new version!
> 
> I assume that the posting of this new version means that you have solved
> the stability issues where the laptop would freeze after sttreaming from
> an ov2740 sensor with metadata once ?
> 
> What about the unrelated ov2740 driver issue where the sensor would not
> always start streaming for which you temporarily disabled runtime pm
> for the sensor as a workaround any progress on that ?

I'm afraid these issues remain.

> 
> Do you have a git branch available with the metadata + this series
> somewhere for easy testing ?  I would like to give this a test run on
> my own IPU6 + ov2740 laptop.

Both of the sets can be found here:

<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ipu6>

-- 
Sakari Ailus

