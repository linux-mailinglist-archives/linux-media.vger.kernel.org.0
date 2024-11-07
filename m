Return-Path: <linux-media+bounces-21065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BDD9C085C
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677E0281B45
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCFF21217B;
	Thu,  7 Nov 2024 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Z6GfSWVG"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9457238F82;
	Thu,  7 Nov 2024 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730988251; cv=pass; b=WKAi+sFi7SP1u1dxfkXf3g90AIho8hvwZuCuHKYPMFgo17WwE1tbIMTkg39xu7fp0oUxhiB39vQdg7nx5vxLzcJevCJt+Ewn/MVL4nF+CSmT65OmBAbY2xuw6nRgsBZ+ZCkw/6P9azZa1s7T1myN5B2WoRbKv7G84pL0NL5xnhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730988251; c=relaxed/simple;
	bh=Q7qDvg3K1OeAHaOm+uBXTvRd7e8uEyGD6oL3IGpybdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H9owQSmdT6J2I7U09M51rdizp4KTWEeMyF8ZyiwhDiMgu3PmdOAML5G7X2BPlrQR4YPKwhxrIXZMYBwGim1FiNBscbfdHfmrVYv979+fvvJxqPdwTOupMI6QwdNTP1iMmg3fwwTLUQ592tvc3gKsBCayzhk0r0Uv01STFpgIlhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Z6GfSWVG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1730988231; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cAh8zomIIAB4HNIz4wiEixoJx133MEtj46riTu9Yd8NqJg7kE5DR46QXf6BHVK5HTTvE5zt3IzRMrRDJxlcbhQwra0Q/xeSduAvgCRKKPaMqSE/QzpLUIKHeILFWP1sKQxFqNUff+3N5GbUuJWodVkmcmUwfO04EOPs5qlkd02g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730988231; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nCITL0jeO0c4x1G2uTEOFNCA/PLW7sUw/Kh9jl7UlUI=; 
	b=H+ypLGMQXeg9wwWc8eb/k3zb01ozH2d7xH8oGC27no3ksCMml5cMVMMaJDvbXwvgBsHR10djp1MmoURlfp45ehs3Z07p2Zj8XQpb9muy0yBJVVY1/7AsOV2XQ2B/jZA8QGNPy9I9kuF9ayNts4zAxTDN7jI+wHiRhetGJFcn9b4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730988231;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=nCITL0jeO0c4x1G2uTEOFNCA/PLW7sUw/Kh9jl7UlUI=;
	b=Z6GfSWVGJ1/bIkzWYixnnYJBHz6VyYwrtQbeV/h30jPxBXwN3JQi1q/uTce4D45n
	eGwGyvhs7qxsuvOO5dCMeisfC4vtBQ/2QXLbtwOrc/Sx9iZl+N6yzSgTrJ0vf5L/wnf
	Ou6mu0vPjhMS4JehzDPa/sk70m8t43MCXhtV3zA0=
Received: by mx.zohomail.com with SMTPS id 1730988229655758.6009425878353;
	Thu, 7 Nov 2024 06:03:49 -0800 (PST)
Date: Thu, 7 Nov 2024 15:03:45 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
	mauro.chehab@linux.intel.com, kernel@collabora.com,
	bob.beckett@collabora.com, nicolas.dufresne@collabora.com
Subject: Re: [PATCH 0/2] Documentation: Debugging guide
Message-ID: <20241107140345.idv7y6udrypns4zd@basti-XPS-13-9310>
References: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
X-ZohoMailClient: External

Hey Jonathan,

please let me know what you think, I have played around with the links
a lot and this is the best I have figured out so far, otherwise I think
I have adressed all of the suggestions besides the FAQ reques frmo Steve
Cho, which I think can be added afterwards to the documentation as that
part requires more research.

Regards,
Sebastian

On 07.11.2024 15:00, Sebastian Fricke wrote:
>The series contains:
>- a general debugging guide split into debugging for driver developers and
>debugging from userspace
>- a new summary page for all media related documentation. This is inspired by
>other subsystems, which first of all allows a user to find the subsystem
>under the subsystems page and secondly eases general navigation through the
>documentation that is sprinkled onto multiple places.
>- a guide on how to debug code in the media subsystem, which points to the
>parts of the general documentation and adds own routines.
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
>- A link to the actual documentation
>- A minimal example for how it can be used (from a media perspective,
>  if the usage isn't absolutely trivial like printk)
>- A rational for why it should be used
>
>To: Jonathan Corbet <corbet@lwn.net>
>Cc: bagasdotme@gmail.com
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
>Changes in v1 (first non-RFC):
>- Move the guides from Documentation/debugging to Documentation/process/debugging
>- Remove the new Documentation/media folder and place the media-specific guide
>  instead into Documentation/process/debugging
>- Reduce the line length to 80 character wherever possible
>- Exchange |code| with © and remove the include
>- Remove :code: specifiers
>- Exchange html links with :doc: and :ref: links, to allow sphinx to convert them correctly
>- Use markdown links only when necessary
>- Various style fixes
>- Improve the description for how to read a crash dump
>- Split the general advice into a separate file
>- Remove unnecessary labels
>- Replace duplicated ftrace example with links to the documentation
>- Add 2 additional debugging sections to the media debugging guide
>- Replace the lkml link with the matching lore link
>- Extend the error checkers section with further details
>- Add intro sentences on the media debugging guide to the various sections
>- Remove ftrace examples and point to the documentation instead
>- Change the section depth to allow cross references via the autosectionlabels
>- Add Elixir links whenever I point to a specific file
>
>Changes in v2 (RFC):
>- Split the media debugging guide into a general and a media specific guide,
>which contains mostly references to the general guide and a few media
>specific aspects.
>- Fill out TBD sections
>- Add device coredump section
>
>---
>Sebastian Fricke (2):
>      docs: Add guides section for debugging
>      docs: media: Debugging guide for the media subsystem
>
> Documentation/index.rst                            |   2 +
> .../driver_development_debugging_guide.rst         | 206 +++++++++++++++
> Documentation/process/debugging/general_advice.rst |  48 ++++
> Documentation/process/debugging/index.rst          |  22 ++
> .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++
> .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
> 6 files changed, 734 insertions(+)
>---
>base-commit: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
>change-id: 20241028-media_docs_improve_v3-3d7c16017713
>
>Best regards,
>-- 
>Sebastian Fricke <sebastian.fricke@collabora.com>
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

