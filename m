Return-Path: <linux-media+bounces-45370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0BC0088E
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 12:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 66BB4342D9A
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 10:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD972FABE7;
	Thu, 23 Oct 2025 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Uc7Ar9hk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371E2DA75A
	for <linux-media@vger.kernel.org>; Thu, 23 Oct 2025 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215900; cv=none; b=iwuyDH9MogfLOe/sDZtaYuul0eeHywoz6qEB6HC0wz5xjow7yOgmh6nQWoq4WYXHadhE+tW6oPzIJobm1+Q3Ps/u2w8/8wfruPRwxhYorIB+TFCtwLkz0CyOl/oQ8iGCCxKqUmrIrvSFR1lGScn8Y2GJhGIa1crDRoTNiUqZfiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215900; c=relaxed/simple;
	bh=GLp1Y2oKZKnRqhEGtyXEI+XsVwpcYKLLCOe0wsnWOzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRe+0eaAzFI3fxO3XARzmboyti2xiFw2pUTrqRfDx+bdJoknnEdo6FBBQuWOhai9PC/jS9bIT8bu6FwLUCGPW4LqyhABWnCtuRwCmUL2TVeh5GPxR2QLd4NnZxCjDGd8WdIg2e3Wdw4ZWYezqs8sDye6Ae2m+lF5tu9VemKLypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Uc7Ar9hk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 673EAEFE;
	Thu, 23 Oct 2025 12:36:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761215791;
	bh=GLp1Y2oKZKnRqhEGtyXEI+XsVwpcYKLLCOe0wsnWOzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uc7Ar9hkKaFl0Ce54ULvB+j3YKzZ4i99+L9vZMAJ5Crwy7fEzLQQEC50+W8qf5pNt
	 N9lx07w0REMi3+o4NDvkT3JdvEEiUCX58QOejcVltk0/fNNeCz7uG1YANb9RRj+HFH
	 3rjsv0lPL4k/OgFUtYmb6Cp0HXmUaKfyeR0hQB6g=
Date: Thu, 23 Oct 2025 13:38:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lili Orosz <lily@floofy.city>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: PROBLEM: regression in commit 0e2ee70291e64 breaks
 non-spec-compliant webcams
Message-ID: <20251023103804.GH19043@pendragon.ideasonboard.com>
References: <dd1c8e46-5616-4395-baac-56fdc4a67be2@floofy.city>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dd1c8e46-5616-4395-baac-56fdc4a67be2@floofy.city>

Hi Lili,

On Thu, Oct 23, 2025 at 12:12:23PM +0200, Lili Orosz wrote:
> Hello,
> 
> The change in commit 0e2ee70291e64 reintroduces an issue that was 
> reverted once before. It prevents webcams that do not follow the spec 
> and have non-unique unit IDs from being usable. This issue is present 
> both in 6.12.54 (LTS) as well as mainline.
> 
> The camera I tested with and can confirm is affected: LSK Meeting Eye 
> for Business & Home. It's very likely that this is not the only 
> non-compliant webcam out there.

Could you please share the full `lsusb -v` output for your device ?

> If I build the kernel with that commit reverted, my webcam begins to 
> function as intended again.

-- 
Regards,

Laurent Pinchart

