Return-Path: <linux-media+bounces-9669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6EF8A8329
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 14:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F25771F22423
	for <lists+linux-media@lfdr.de>; Wed, 17 Apr 2024 12:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1569913D293;
	Wed, 17 Apr 2024 12:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="G8xVxPCH"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5414D29CEB
	for <linux-media@vger.kernel.org>; Wed, 17 Apr 2024 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713356965; cv=pass; b=GXfIKCzWOyo9ZTKSLAoQc3PnH3EO2QjtnydWHJL0CNDxF/jpSM1Wx6FBNYPtipBC/bZ5ZZb+xUm7o4kD2+AFwaqb4jXjWr9+I4f7r6kThMoSqXicfSFpCg2tX6pRapH/RG6f1ZOJDeQGuZ8h+FBCsAM7LkZgu0wcDQirFt5tTRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713356965; c=relaxed/simple;
	bh=bM47jp/QwQ/2f/KJal+UVxhrcS7V97V/hYfSpYl+dsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2et5SMXV3/Fsg6ypHT4YoGqakUsELpAO6ubRN0vW9IIr7bolDSXw1L6kBr+qeXGNzqWLhQt6eq8GVKb58N14RrrvkRS2sBnq7rOloUzjqZ0O2f9FqoQUAGZ4Y0e1mUZ9e6I+tVCDJayiqHf3xDMVpoLNNUIJok/kcS433GUOaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=G8xVxPCH; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VKKw80nDrzySr;
	Wed, 17 Apr 2024 15:29:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1713356952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zOVLzt6kggFOQk/uNQaRK9t0ofyO7kDr9wAGsl2gU6M=;
	b=G8xVxPCHh75ceCljjvc1QK2QHfM5U6uEzPcanGr18WWMvzieII/OrM8WV/SXsx8s0ONmgn
	tp5IQpN8Ce8KlkFsS3nvp7v3ARDEAvWhM6uz5cavmqLmgCPXcz2Xl8Omc+7TfoK8PDrKwI
	NwKLav76IeNGGO2gERIiWtUkSbV0MS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1713356952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zOVLzt6kggFOQk/uNQaRK9t0ofyO7kDr9wAGsl2gU6M=;
	b=watg02R86eTC+/NZfGSaXIeDSnEeUQq1mElEnNYJGM3BuA3zVJeTF2TR6pHM2KyIAVA0+N
	kvdQLjJsXR7XJizXSQ7/XFzab1PFpG1zCz1u7X8opGLMAHsMq4GwqGPHqpR0PtDyctwTq2
	K2W1LpcVTR/SUkL6aF3Xt33e23PCAJI=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1713356952; a=rsa-sha256; cv=none;
	b=GS9RtNLmHbp6tbpAfq01t22wCWctAx3qTNpLKIcPOmbECtdTDbjBA8lYw2xPhPxHpuko+n
	iGypOgjzgCU6gyYuhYqTdgSIZNqx0+Pl0Pq3gWrCvwiiVdlYNBBTbbkqzxsHY8C2wgODO6
	9aIxkmf0Dc351nE+PPQM6DTCAvoQ2E8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B1E05634C99;
	Wed, 17 Apr 2024 15:29:09 +0300 (EEST)
Date: Wed, 17 Apr 2024 12:29:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com, tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org, senozhatsky@chromium.org,
	andreaskleist@gmail.com, bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v4 00/19] Intel IPU6 and IPU6 input system drivers
Message-ID: <Zh_AlVn0IgKtV7GU@valkosipuli.retiisi.eu>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
 <77c32f87-cdec-4dd0-85b8-c75ca7405438@hansg.org>
 <Zh-Jr2gfdoCeB5-4@valkosipuli.retiisi.eu>
 <0ce5cc60-da32-4e0a-89bb-fa481d4a15b1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ce5cc60-da32-4e0a-89bb-fa481d4a15b1@redhat.com>

Hi Hans,

On Wed, Apr 17, 2024 at 10:59:37AM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 4/17/24 10:34 AM, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Wed, Apr 17, 2024 at 09:56:40AM +0200, Hans de Goede wrote:
> >> Hi Sakari,
> >> On 4/16/24 10:10 PM, Sakari Ailus wrote:
> >>> Hello everyone,
> >>>
> >>> This patch series adds a driver for Intel IPU6 input system.
> >>> IPU6 is the sixth generation of Imaging Processing Unit, it is a PCI
> >>> device which can be found in some Intel Client Platforms. User can use
> >>> IPU6 to capture images from MIPI camera sensors.
> >>>
> >>> IPU6 has its own firmware which exposes ABIs to driver, and communicates
> >>> with CSE to do firmware authentication. IPU6 has its MMU hardware, so
> >>> the driver sets up a page table to allow IPU6 DMA to access the system
> >>> memory.
> >>>
> >>> IPU6 input system driver uses MC and V4L2 sub-device APIs besides V4L2.
> >>>
> >>> I can now capture images from ov01a10 and ov2740 sensors (including
> >>> metadata from the latter).
> >>>
> >>> The series applies on top of the metadata patchset
> >>> <URL:https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/T/#t>.
> >>
> >> Thank you for the new version!
> >>
> >> I assume that the posting of this new version means that you have solved
> >> the stability issues where the laptop would freeze after sttreaming from
> >> an ov2740 sensor with metadata once ?
> >>
> >> What about the unrelated ov2740 driver issue where the sensor would not
> >> always start streaming for which you temporarily disabled runtime pm
> >> for the sensor as a workaround any progress on that ?
> > 
> > I'm afraid these issues remain.
> 
> You mean both issues remain? I'm not that worried about the runtime-pm ov2740
> issue, but if the lockup after streaming issue also remains that is a lot
> more worrying.
> 
> I've been running an older version of this series without the metadata
> support and that is pretty rock solid, so this seems to be caused by
> enabling metadata support.
> 
> AFAIK the current out of tree solution with partly closed-source
> userspace stack does not use metadata right /
> 
> Do you know if the Windows stack uses metadata capture from the sensor?
> 
> If neither the existing out of tree Linux stack nor the Windows stack
> is using metadata capture then chances are we are actually hitting
> hw/firmware bugs here. This would not be the first time that the Linux

Interestingly, the same sensor works differently on different systems with
IPU6 and the same sensor.

We'll look into this but I don't know when I have more information.

> community tries to enable a hw-feature not used by the factory installed
> OS for the hw and ends up failing miserably because the feature was
> never fully tested and turns out to be full of bugs.
> 
> IMHO if we cannot get the stability issue fixed real soon it would
> be best to move forward with this patch series without adding
> the metadata support. So basically drop patch 17/19 .
> 
> >> Do you have a git branch available with the metadata + this series
> >> somewhere for easy testing ?  I would like to give this a test run on
> >> my own IPU6 + ov2740 laptop.
> > 
> > Both of the sets can be found here:
> > 
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=ipu6>
> 
> Thank you.

-- 
Kind regards,

Sakari Ailus

