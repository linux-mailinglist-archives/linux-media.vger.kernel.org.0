Return-Path: <linux-media+bounces-2433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2C8813E3F
	for <lists+linux-media@lfdr.de>; Fri, 15 Dec 2023 00:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FF751C20D95
	for <lists+linux-media@lfdr.de>; Thu, 14 Dec 2023 23:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD2F6C6EA;
	Thu, 14 Dec 2023 23:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sensoray.com header.i=@sensoray.com header.b="vlsZ10JL"
X-Original-To: linux-media@vger.kernel.org
Received: from omta33.uswest2.a.cloudfilter.net (omta33.uswest2.a.cloudfilter.net [35.89.44.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D956C6C8
	for <linux-media@vger.kernel.org>; Thu, 14 Dec 2023 23:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sensoray.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sensoray.com
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
	by cmsmtp with ESMTPS
	id DtyxrRPrG8HteDv7nrpbT5; Thu, 14 Dec 2023 23:28:16 +0000
Received: from gator3086.hostgator.com ([50.87.144.121])
	by cmsmtp with ESMTPS
	id Dv7mrKyRG1J28Dv7nr1b65; Thu, 14 Dec 2023 23:28:15 +0000
X-Authority-Analysis: v=2.4 cv=Tqz1ORbh c=1 sm=1 tr=0 ts=657b8f8f
 a=qMXOcmIMY6YlrKEg1GzxDg==:117 a=QsTHvn2EeHXCImuSLmd++Q==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=kj9zAlcOel0A:10 a=e2cXIFwxEfEA:10 a=6kiSLZGAxYIA:10
 a=9oObU6-WBvz7YYL1JhYA:9 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sensoray.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XkAmn6nwsmae/INSb/+ZlR+kcFMPIgJqy6uWM7CZz2I=; b=vlsZ10JLKQP2tY61UiteSUr+Ri
	4DlQRplJoyrjmCyKmwY5iryyoQvjrx+HYIq6Mim4Yn0DZeghmiCsFMsZN74fgH6acgfg+KVmP9nAC
	Rre7AqBAMLbJolFPOEw2S+hzRqUTiXgBI7gfdj0OogGL52hEttZqYv2MqBIWWxpzMDY0=;
Received: from gator3086.hostgator.com ([50.87.144.121]:30050)
	by gator3086.hostgator.com with esmtpa (Exim 4.95)
	(envelope-from <dean@sensoray.com>)
	id 1rDv7m-003n00-Dt;
	Thu, 14 Dec 2023 17:28:14 -0600
Received: from mail.thomaswright.com ([50.126.89.90])
 by www.sensoray.com
 with HTTP (HTTP/1.1 POST); Thu, 14 Dec 2023 17:28:14 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 14 Dec 2023 17:28:14 -0600
From: dean@sensoray.com
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: usb: s2255: add serial number V4L2_CID
In-Reply-To: <917c4e00-28bd-416f-9be7-b87717b3cf2f@xs4all.nl>
References: <20231208223815.130450-1-dean@sensoray.com>
 <917c4e00-28bd-416f-9be7-b87717b3cf2f@xs4all.nl>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <e4d2dda6f0ec4abfad064a994466843f@sensoray.com>
X-Sender: dean@sensoray.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3086.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sensoray.com
X-BWhitelist: no
X-Source-IP: 50.87.144.121
X-Source-L: Yes
X-Exim-ID: 1rDv7m-003n00-Dt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: gator3086.hostgator.com [50.87.144.121]:30050
X-Source-Auth: dean@sensoray.com
X-Email-Count: 1
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: c2Vuc29yYXk7c2Vuc29yYXk7Z2F0b3IzMDg2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKsRcqqvuaUf2SgFfFqKh3BO9mtCvHq4/jzWTjLK2SPk+JIiA8mMvLBG55ZWzs0NM4lixWU+aQ7n/fQdQmOh76wyWEffdim6hlz4mzTyG40gaFs3Nb+T
 CWU/iKVLqGrwU0zPPF1brzqZ0fiEOXx9qpWrHENdpZ4sZ/Z0vm1PC270LvOoODLGqIrT9VRGvn85EKNCG3/QEa2uVxJJ8BofKqk=

On 2023-12-13 04:03, Hans Verkuil wrote:
> Hi Dean,
> 
> A few more comments below.
> 
...
> I never noticed this before, but there is a call to
> v4l2_ctrl_handler_setup() missing
> in this driver! That call ensures that s2255_s_ctrl() is called with
> the initial control
> values.
> 
> It's probably something that should be added.

If this is added, it needs done very carefully. Adding it to probe will 
100% break the firmware load. s2255_s_ctrl sends a USB command to the 
board and the asynchronous firmware load shares the endpoint for 
commands.

The initial brightness, contrast, hue, and saturation default values 
match what the firmware sets when first loaded. It's redundant to set 
them again immediately after the firmware load succeeds.  I think at a 
minimum this belongs in a separate patch.

Regards,

Dean

> 
> Regards,
> 
> 	Hans

