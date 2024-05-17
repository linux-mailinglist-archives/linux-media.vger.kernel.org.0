Return-Path: <linux-media+bounces-11585-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CD8C82E7
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 11:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA9761F21561
	for <lists+linux-media@lfdr.de>; Fri, 17 May 2024 09:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5935C286AF;
	Fri, 17 May 2024 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="YnsB0o80"
X-Original-To: linux-media@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CC420313;
	Fri, 17 May 2024 09:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715936634; cv=none; b=qHcfEGeViWocuiNmx+M6J+2lnsuO71u0XhEYS88Or6v3f7AbZAe7FSHODgEFa/vWLQL8ox7pkfu5MLfC1eddjoI+SNys9WjGx36F4XM8rpZL7/RNSMj3hCsvqDcB7eYGyvmSMRNvHN/1F0CtlsKRsHbaeLj7anq/HYTJYytE3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715936634; c=relaxed/simple;
	bh=lSYn1SIS2fkvLCLFM+efNsgxEGwWxnkze40au5ChSvA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2DypDNOZq1+IRrbRY32WwTZp0NOfCgq7QJTYy+D7v2jdR9itsI5XafUuB4+nQCa707Cbvo6Vm/QOkGXEnTQB6ja2JkmaC5XJaE3h8FgFqjrKiXqGrt2oy0kO5BRpDLW+C4d1GUamHBl7BpmOgOqrG8KFdYOzSHqv3hv89dLE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=YnsB0o80; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1715936630;
	bh=MwpP6VQrwBifZRjJxzXqLOLi6//U/+JHEGrk8rK8hBE=; l=579;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=YnsB0o80T01qrKKLuYsmTfiUDQlaZwCuHAgWsNnpUaH2eEe+H/j7nKxnu8cvKAreg
	 /mCFynPeFSxp9DxfnOKGxC62dzwZ6nEjSGiumedVL9Aa0OdJSpoWcPSs4vqNP6Fc+R
	 1SZZz3vqMD62gYP2npsocIMIc0N3cEqE6rAzf0ZTtqcdYID6lOlUhJljRPxawvFVxM
	 N0mblc0439Pb/i67vvxHwGUzLeq+LlITdi5OPT22hmaIDB4m4iLZXMlJmdnQm/oqaM
	 2gRrP1JbTWKmhEOISJXMbCKkNJItVtiy/iOsvE6lJQw660uf+bV7uvDIAPtUkX5XHU
	 r1DBRSG2aNnAA==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(3213197:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Fri, 17 May 2024 17:03:31 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 17 May
 2024 17:03:30 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 17 May 2024 17:03:30 +0800
Date: Fri, 17 May 2024 17:03:30 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Daniel Scally <djrscally@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: v4l: async: Fix NULL pointer dereference in
 adding ancillary links
Message-ID: <20240517090330.GA23279@linuxcarl2.richtek.com>
References: <57fca5dbcb8e157371deeba019eba430bf7148b2.1715935535.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <57fca5dbcb8e157371deeba019eba430bf7148b2.1715935535.git.cy_huang@richtek.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Fri, May 17, 2024 at 04:51:29PM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> In v4l2_async_create_ancillary_links(), ancillary links are created for
> lens and flash sub-devices. These are sub-device to sub-device links and if
> the async notifier is related to a V4L2 device, the source sub-device of
> the ancillary link is NULL, leading to a NULL pointer dereference. Check
> the notifier's sd field is non-NULL in v4l2_async_create_ancillary_links().

Not seeing the message 'No send the v2 patch'. Please ignore this one.

