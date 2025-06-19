Return-Path: <linux-media+bounces-35249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44520AE01CE
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 11:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E26CC17D0AD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 09:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE9121D3FD;
	Thu, 19 Jun 2025 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqyom7eC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95021C9E0;
	Thu, 19 Jun 2025 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325852; cv=none; b=Tzue2ZsmKVtW3dd70aRri17XTtk1PvrWzJM/0+EI4ORnd1dvrG8lVd+1ZtZAMg0AODdRstEQDa3O+gNIz7Cz1qTtGBqiOzgMOY8bWpwxcnNP5mAZ3lWsvHPtiO7iC9Hoz//I7qebmCdYV4RYRwzcC8kQB5JxNG/VJoJHHn0TDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325852; c=relaxed/simple;
	bh=Q6+PcrCP4e57NDIVTr+bY58aKjN8i9/eQt4updCs1z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NbtnW8M+KxOdRdWIdNF7Zd+FCet+m31YySg6d0+jigmZAHjhwVcZpPE1JJPDwWqsqax5HoKlWkUAZEbjhSxMZGkUItWRKR24cU5M2dm1MyXuE/Cnq7hM7SjPcrRaYcUAMTUuOvkJAej9/SVYZ3bDb5lUFaN3e8QBGLoKygGBxiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqyom7eC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D65BC4CEEA;
	Thu, 19 Jun 2025 09:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750325851;
	bh=Q6+PcrCP4e57NDIVTr+bY58aKjN8i9/eQt4updCs1z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mqyom7eCwumDLE4vTncbuEaqguaDHlStVKLTzraNuHaxle1K2rZfA5rWPAWpCnNSj
	 zvCETmug2gOwlmXTrVNRKu4eTrq7oIq18G/7VNGpTWxhioaUyV6+OONnLHHODqqv2z
	 6k4wMxPEVX2f7UJwbHG4yNt52f3o8FpbY1POcIemuPmw0FHaZr2H47jIn6ovPngSMa
	 7Jf/4loUiOZb/12Xf3GBVpP7095+yJPH8DLS1FOEvpLGWrwqOH3qZuZpf5q4Lxks9f
	 uTlWe5PSSSOSmJDfk2JDYx968rSLNKrJ+rzO66N4aFXqENNq3n48rVYlhQcPH3YVq9
	 tSJ9w8531zLOQ==
From: Lee Jones <lee@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Richard Leitner <richard.leitner@linux.dev>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20250617-ov9282-flash-strobe-v5-3-9762da74d065@linux.dev>
References: <20250617-ov9282-flash-strobe-v5-3-9762da74d065@linux.dev>
Subject: Re: (subset) [PATCH v5 03/10] media: v4l2-flash: fix flash_timeout
 comment
Message-Id: <175032584928.604443.15779695084855330292.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 10:37:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 17 Jun 2025 09:31:37 +0200, Richard Leitner wrote:
> The comment for the flash_timeout setter mentioned it is the "flash
> duration". Fix this by changing it to "flash timeout".
> 
> 

Applied, thanks!

[03/10] media: v4l2-flash: fix flash_timeout comment
        commit: 6012ce6b30567aa8ec8dc5b648b7841f9f74ca7c

--
Lee Jones [李琼斯]


