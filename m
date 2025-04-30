Return-Path: <linux-media+bounces-31391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054AAA45D0
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFEC11894DBA
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EAF21ABAB;
	Wed, 30 Apr 2025 08:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="sDbuyOER"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B445218E81
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002635; cv=none; b=WYnH60+XovlVbywHEgiqDL6SEKHcxrsXxgWwpKCqVXInsXxXTjB53GUcDMu38k+FviLbOOoqirfF7FBQp+p3k0r+wUO/WS9WRL/fwew9AaWanGnKAqXF+vPje/E9WWxKXfFGfqtu0Ne34CfACAckn+ldByWOhMpFp7JtiZSWLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002635; c=relaxed/simple;
	bh=Mo31dNR6jEoD3EtWHZ2MpA5euDVFCBethrQzQQRSDWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVfQU2GPnKGUjkNQcdMV0UPBFjq+95M3isVdL8hsDXieKKXWlcpkK7NSIbSnFGvcTfeNF+0nfkDH6xPcSwmM+QasR7ts/iRJJHcUH5XYHwez+V02555bsB4pxhIwY9+XIzcocb5n4ewT1Y4CXzL2d/7a7g43gRiyvtzOmgWk8hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=sDbuyOER; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 70593b73-259f-11f0-beb8-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 70593b73-259f-11f0-beb8-005056992ed3;
	Wed, 30 Apr 2025 10:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=SQr3CZDmsWNWgXE+Y5vUNC/ag/3bE6yEElvW0UXkqCU=;
	b=sDbuyOERauDCMHwWOvYMClItKm2U8t2KGSqgqS+BjNpn/vtUatdEq/rYNwXVjBwbqKgXyMnqVvN1C
	 MeWpdFAG/2URiHlyvSSpAfYiK6O3Lrci2HKPU4pQ02Nn04kUKkockpYAEKxi9BsnxwSDRihHude01q
	 HgtrO/xqy+Ai8Idm6BJqxfYfdSY/nymQPTvdRnGMweeNGLUQnU5+vhQ1ufvBknVbqb+Ej9wvD5QLrP
	 zixuxrW4B/79m3n2e/3MBJXvlURmQ1AQvHWx4VRN1doegSwuM3bRhbbWYDQe/6ZQKj//qUENwSzzOj
	 /T7FUffd6LoqqclXN+70vJ8V4zuoqiw==
X-KPN-MID: 33|W4wbe5Z3Wh0LWGEJj7awC6CRXVN2ZB6Jc9rRx69LDCmgw3VEm3snK1U/f+nFWiu
 1LE6DQCZPxBFs4QcL8NlLVhQyg2ANq0rzxiiveZWdngw=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|yVjOyx/LIlTMnsSDkmQinXcRMwwJ0lqMOTaEF6oK5NpFmUrmrVBcwzfs04X7xMT
 y9ZYQi2o5F6SpH6lkinb0mg==
Received: from [192.168.2.10] (unknown [178.74.16.2])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 14ba80e9-259f-11f0-9dba-00505699b758;
	Wed, 30 Apr 2025 10:42:43 +0200 (CEST)
Message-ID: <1f62c662-b038-4c61-8835-9e94dbc712fa@xs4all.nl>
Date: Wed, 30 Apr 2025 10:42:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH] v4l2-compliance: Don't perform blocking DQBUF
 test on MC_IO devices
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250429203922.23078-1-laurent.pinchart@ideasonboard.com>
 <aBHd2FUeOCjLlnl-@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <aBHd2FUeOCjLlnl-@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 10:22, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Tue, Apr 29, 2025 at 11:39:22PM +0300, Laurent Pinchart wrote:
>> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Streaming on MC_IO devices can't be tested by v4l2-compliance as it
>> requires setting up a valid pipeline first. The blocking DQBUF test
>> therefore fails to start streaming on those devices. Disable it.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for the patch.
> 
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>

Feel free to commit yourself.

Regards,

	Hans

