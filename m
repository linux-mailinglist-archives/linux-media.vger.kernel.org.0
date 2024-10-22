Return-Path: <linux-media+bounces-20049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 016239AB1E7
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA043B210FB
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05331A302E;
	Tue, 22 Oct 2024 15:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="B1pkcf8i"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA48121F;
	Tue, 22 Oct 2024 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729610621; cv=pass; b=Ffgs7Zt1WbLBGnVnXRWUEFkEv6iZbQVDbGz+Ly0DRgVUXlVADvBfrIjsup3rcVA5DS7pa8lq25oVyR2DxzmIEEK6jaLO3MKk2FxpXySAhD1CdBXCha0q3xM/eZeDKpN2+s8u/avK6APEoOXRO31sHH4gTXnWBV2vxJLFTOyeagI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729610621; c=relaxed/simple;
	bh=YdjLWbKV6I+Jq5DwSZ100ofxFGPLo6oN9au1GsIzN2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1jGCOdM7BlOU7416OAfoYe/vu5vG+XN6q2/w/FUAl2D75SYuLOju5MewrDMqpEXllJ588SNdAEGZ5evHOptmdsAki6wZZuktlIGu2GqinQZVUm6EZ03YDfwWgNpPN0Vx43Q7F1bS4IKp/K7VJ8culTItpLLe5FWJkEtYjqsc/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=B1pkcf8i; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1729610603; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=StekWfTfZqx+zUD7EmEEa1Oa+AfvWNhXyRcLAWXvg0LbwdxI5jaaqUxlUMMNtQC+CGw65wRu45EL9HoZGYLe1k52pmUTfJehyyYmtLBppto6+Nihbzi7oP1TtUzqVYsc21QBsPQKlC9P9whF/Nbo92zsff7gJeehum/cDs9FyTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729610603; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OiXhH5JbEf6ptxs9TkpnJmV08ydgDOpc5CR9nLX3LM0=; 
	b=R2JPAKAKBdrfZck+5V7iRqBcFlh17/bpZLQ/X3QaUWn233PJSGtJf5Hyy7uzYwzhCfYnxB/sHJBGN+Jfx/omYnowOjoZjYizgcndnLw5PZE+uzkZ3gBV/SMAk7oaRx3W+c83633uHHblBHgEVLhzO8MmO1S4nUcFpCJzlE2z4i0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729610603;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=OiXhH5JbEf6ptxs9TkpnJmV08ydgDOpc5CR9nLX3LM0=;
	b=B1pkcf8iV5xfj56fNwcnly4dA7sX+/IFK+eirPdHsQa3cSMakz41BVOtDGQLJQrF
	/vPlYrQXqaLa+GzL5jAMHi+imtwUBP+lg3pERSJjfKFyagDRrkxsxmCNo9yorgfi+3H
	K/UGCy1+Epl6r+S0C2Z+Poxy+7bpig8UpXtKhOGY=
Received: by mx.zohomail.com with SMTPS id 1729610600942358.02892702066595;
	Tue, 22 Oct 2024 08:23:20 -0700 (PDT)
Date: Tue, 22 Oct 2024 17:23:16 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com,
	kernel@collabora.com, bob.beckett@collabora.com,
	nicolas.dufresne@collabora.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 0/3] Documentation: Debugging guide
Message-ID: <20241022152316.yr6jpjtcwidxytpe@basti-XPS-13-9310>
References: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240529-b4-media_docs_improve-v2-0-66318b2da726@collabora.com>
X-ZohoMailClient: External

(CC: Grep KH)

Hello,

On 24.09.2024 10:45, Sebastian Fricke wrote:
>The RFC contains:
>- a general debugging guide split into debugging for driver developers and
>  debugging from userspace
>- a new summary page for all media related documentation. This is inspired by
>  other subsystems, which first of all allows a user to find the subsystem
>  under the subsystems page and secondly eases general navigation through the
>  documentation that is sprinkled onto multiple places.
>- a guide on how to debug code in the media subsystem, which points to the
>  parts of the general documentation and adds own routines.

I wanted to give this a little push, so far I have received a lot of
good feedback but none from the core and documentation folks. What do
you think about this?

Regards,
Sebastian

>
>WHY do we need this?
>--------------------
>
>For anyone without years of experience in the Linux kernel, knowing which tool
>to use or even which tools are available is not as straightforward as some
>senior developers might perceive.
>We realized that there is a general need for a kind of "start page", that
>allows especially beginners to get up-to-speed with the codebase and the
>documentation. The documentation in particular is currently quite hard to navigate
>as you mostly have to know what you are searching for to find it.
>
>WHAT do we cover?
>-----------------
>
>The document is structured into two sections:
>
>1. A problem-focused approach: This means, a developer facing an issue matching
>one of the given examples, will find suggestions for how to approach that
>problem (e.g. which tool to use) in this section
>2. A tool-focused approach: This sections highlights the available tools, with
>comparisions between the tools if sensible. The goal of this work is
>**duplicate as little as possible** from the existing documentation and
>instead provide a rough overview that provides:
>    - A link to the actual documentation
>    - A minimal example for how it can be used (from a media perspective,
>      if the usage isn't absolutely trivial like printk)
>    - A rational for why it should be used
>
>To: Jonathan Corbet <corbet@lwn.net>
>Cc: linux-doc@vger.kernel.org
>Cc: linux-kernel@vger.kernel.org
>Cc: linux-media@vger.kernel.org
>Cc: laurent.pinchart@ideasonboard.com
>Cc: hverkuil-cisco@xs4all.nl
>Cc: mauro.chehab@linux.intel.com
>Cc: kernel@collabora.com
>Cc: bob.beckett@collabora.com
>Cc: nicolas.dufresne@collabora.com
>Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>
>---
>Changes in v2:
>- Split the media debugging guide into a general and a media specific guide,
>  which contains mostly references to the general guide and a few media
>  specific aspects.
>- Fill out TBD sections
>- Add device coredump section
>
>---
>Sebastian Fricke (3):
>      docs: media: Create separate documentation folder for media
>      docs: Add guides section for debugging
>      docs: media: Debugging guide for the media subsystem
>
> .../driver_development_debugging_guide.rst         | 193 +++++++++++++++
> Documentation/debugging/index.rst                  |  66 +++++
> .../debugging/userspace_debugging_guide.rst        | 269 +++++++++++++++++++++
> Documentation/index.rst                            |   2 +
> Documentation/media/guides/debugging_issues.rst    | 174 +++++++++++++
> Documentation/media/guides/index.rst               |  11 +
> Documentation/media/index.rst                      |  20 ++
> Documentation/subsystem-apis.rst                   |   1 +
> 8 files changed, 736 insertions(+)
>---
>base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
>change-id: 20240529-b4-media_docs_improve-79ea2d480483
>
>Best regards,
>-- 
>Sebastian Fricke <sebastian.fricke@collabora.com>
>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

