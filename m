Return-Path: <linux-media+bounces-18323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DAD97ABEB
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 09:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160961C21320
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 07:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C407D12F59C;
	Tue, 17 Sep 2024 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FNYlk3SO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76C364D6
	for <linux-media@vger.kernel.org>; Tue, 17 Sep 2024 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726557440; cv=none; b=QZB/UFj8iRNvtFBfcggsgHCEsw4orwzyr7qIDYmCfH1nrs0OPwBV9crJl/1SROCtMlAZRXyxajSDSsXet8ZR6P5gCaC7W4yK2L0ZseX09CWolbhaPh1SHJSJLl8+u9sYTa0Znh7I3kkeECEzPWGlhwL+GqiYUeg4hp3m8udt8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726557440; c=relaxed/simple;
	bh=6r5PtR68DuMjlN8kdco/c+DvXtUJFOaZqBFwJrjffhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF8zEV3UoXVjCRq5GcQ0ErPEOxGPO2oSAbkVLSAotH5Wm8R4tuOd/sRxEyDmNjqqO0etx5QbuxoNTjKGYmUzGSfqBZy1zlX86yz+iErZ+voUbxS8x13bj+fJDh3r/LdInBUK9+Qwg+yoKwCxFRoR9GumFHrjnkXg9q6WegQP6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FNYlk3SO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:871:25a:ec59:3d1a:445d:1ce:732e])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C481B3C7;
	Tue, 17 Sep 2024 09:15:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726557353;
	bh=6r5PtR68DuMjlN8kdco/c+DvXtUJFOaZqBFwJrjffhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNYlk3SOVEdQ4nn6cLk+/FvP7GZNbvhRCAUpRBQ6edFC9XVUFykVljm6f1LbhjeQd
	 2+0vtwRAkGI//rXlJlvkf/0u87E2kVXXg+zryqEdZ+/TgwXBEAokWKczIuC67DoNgq
	 jKb3xgkQxhXsz65vHHr21zusqiI0sPX2MAHLlS8k=
Date: Tue, 17 Sep 2024 09:17:11 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
Subject: Re: libcamera workshop in Vienna - September 17th - Agenda
Message-ID: <uxyvhfxsqu7nuebbghhn2fuup7i4vmoqdnh32peqdv3vsgplzh@s7bnfxg3tvb5>
References: <20240914234300.GA28657@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240914234300.GA28657@pendragon.ideasonboard.com>

Here is the link to the meeting notes

https://pad.systemli.org/p/-WTEuSlOlQJfOfM2St9I

On Sun, Sep 15, 2024 at 02:43:00AM GMT, Laurent Pinchart wrote:
> Hello,
>
> Here's the agenda for the workshop on Tuesday. As all workshop agendas,
> it's tentative and we will adjust the exact timing depending on how the
> discussions progress.
>
> 09:00 - 09:15  Welcome and agenda bashing
> 09:15 - 10:00  Non-image data streams (Naush Patuck)
> 10:00 - 10:45  Per-stream controls (Naush Patuck)
> 10:45 - 11:15  Break
> 11:15 - 12:00  What and how we would like to achieve with software ISP
>                in the foreseeable future (Milan Zamazal)
> 12:00 - 12:45  Post processing with pipeline handler (Jerry W Hu)
> 12:45 - 13:45  Lunch
> 13:45 - 14:30  libcamera and Khronos Kamaros (Suresh Vankadara)
> 14:30 - 15:15  Raw reprocessing API (Naush Patuck)
> 15:15 - 15:45  Break
> 15:45 - 16:30  Specify tuning file at camera open/acquire time (Naush
>                Patuck)
> 16:30 - 17:15  Cache handling (Robert Mader)
> 17:15 - 18:00  TBD
>
> Each agenda item is listed with the name of the person who proposed it.
> We expect those persons to introduce the topic (orally or with slides,
> at your discretion) and drive the discussion. We will take care of
> topics proposed by people who unfortunately won't be able to attend.
>
> We will use Jitsi Meet for remote access. The event will be accessible
> at https://meet.jit.si/libcamera-workshop-vienna-2024. We can however
> not guarantee the quality of the network connection on site.
>
> All times are in the CEST (UTC+2) time zone. If you plan to attend
> remotely and are located in a time zone that makes the agenda items you
> are most interested in occur at an inconvenient time, please let me know
> and we will try to reorder the discussion topics.
>
> Discussions will not be recorded, but the minutes of the workshop will
> be posted to the mailing list after the event.
>
> --
> Regards,
>
> Laurent Pinchart
>

