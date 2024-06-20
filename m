Return-Path: <linux-media+bounces-13812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16726910554
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 15:07:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD48E28256A
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 13:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FC61AF682;
	Thu, 20 Jun 2024 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="u9+i9L4a"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB9F1AD407
	for <linux-media@vger.kernel.org>; Thu, 20 Jun 2024 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888462; cv=pass; b=FNWqD656E8xFRL0Eh5tQqOdX5v4r5Iisa5etrfq4JukE0EBqftD4Ww1Vxxlx2QK03vMIPeRE04tenudB3nD3lx2IAhEv1vZCsc4s1ibZu6by6tei28V5+RogYUUNJOQP4e9UQnoT/FsvHNhDWG7qG3YQQpfmEUrVbvqjveDBwhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888462; c=relaxed/simple;
	bh=RoMLkBmfljslwParlFZKo2zaXUUFlX7xgw5Vs2gcgnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2ragfi1ywaY+NAmvaoMY1vvzkROKsiS667VkSkhmF6D/hCGHzJKfOla2qRuBB7XNpzkOCVjMMY9aDHa091zKk8yf3VEEinlqegvwBwhwvf9qONpXPeX0tv7qmTZm/fnJdjDQjH63HMuTrGRF2sOpUq/dpcYp2mq4A2vBeI3Sa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=u9+i9L4a; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4W4gb54QfDzyYB;
	Thu, 20 Jun 2024 16:00:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1718888450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rY7QMq/V/jryhvIQ1kL+O3mfbstt41aW5Q24d4FRXCk=;
	b=u9+i9L4awGO40sUrpmIe7AXyvbuLw7PvJOS1x0fj81bIpSNN3hyIYP4HntCMNMbDmv/f4y
	DCWLupfwY6azI68dKpXo3jmk4PO09lQIQV8DCWIQi+Eegvr/jJuBjJ7aUheNvuzfZYgbap
	9RZZxhbf6lUJETtlhqWl8N9e0BWPTCE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1718888450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rY7QMq/V/jryhvIQ1kL+O3mfbstt41aW5Q24d4FRXCk=;
	b=D+MOWbWKBjftreO+aW5z2OgUpuhCRYeXnzmcDH7xG5pfvpPSh5lJ9Fgd1tPsCm3kOavmpu
	vBwpSQTedq5NdQf/1FAAodKD7IxlwnI68lps2l4Bno58WnWro0RjnYB58jZD8UzYv6+5Ep
	I/cpJDpaR/7ogmo1aC+vXzlr42uEIaA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1718888450; a=rsa-sha256; cv=none;
	b=AsdDaUaKVcml0dg/BTMwrL4iQ7Zfdr8b7afXIBUFDmBnbAdHwgmkznsQDp5195IVaVHGID
	ftjHk2sAuyplgyxTB+49k6CaJuhOSg9En8xv3HoY1RzxwN+9xfNPbxfKV9gWAn5C7pRdpW
	F3MhTpezgK96i2gdS9+e5Yg/GMuO2lk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 86BA8634C93;
	Thu, 20 Jun 2024 16:00:47 +0300 (EEST)
Date: Thu, 20 Jun 2024 13:00:47 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-media@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/9] media: vimc: Don't iterate over single pad
Message-ID: <ZnQn_z6OzCUBa0zS@valkosipuli.retiisi.eu>
References: <20240424235741.17093-1-laurent.pinchart@ideasonboard.com>
 <20240424235741.17093-2-laurent.pinchart@ideasonboard.com>
 <bad644d0-f139-4df4-bac8-e64cc8e8324c@linuxfoundation.org>
 <20240530194515.GA28160@pendragon.ideasonboard.com>
 <339ab149-6cfc-498e-9650-e72e7e2cd039@linuxfoundation.org>
 <20240530202153.GA23937@pendragon.ideasonboard.com>
 <8b6661d4-b5e6-4fc6-a064-748ec9e073ff@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b6661d4-b5e6-4fc6-a064-748ec9e073ff@xs4all.nl>

On Thu, Jun 20, 2024 at 12:47:15PM +0200, Hans Verkuil wrote:
> I agree with Laurent on this. Sensor and debayer subdev devices have
> hardwired pads determined by the hardware, it is not something that is
> flexible. Since this is also serves as an example of such a driver, it
> makes sense to hardcode it, as that is how it is done in practice.

Me, too. If you know you have one of something, there's indeed no need for
a loop.

-- 
Sakari Ailus

