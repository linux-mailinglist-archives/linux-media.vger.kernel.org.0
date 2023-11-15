Return-Path: <linux-media+bounces-402-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACB77ED357
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 21:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E371B20A1D
	for <lists+linux-media@lfdr.de>; Wed, 15 Nov 2023 20:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C0143AC7;
	Wed, 15 Nov 2023 20:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="GYTPwPsR"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BE9130;
	Wed, 15 Nov 2023 12:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700081333; x=1700686133; i=wahrenst@gmx.net;
	bh=ypxpEu+E0kHcuilYibpyqAXw46fKdmZ7pidbQt42PLA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=GYTPwPsRzyIlkC2jwDNYvQU+r3re+zQNPL9Mr/6w5tM4cJpbh4wt5ruhnTe5gVXL
	 jkIRXdEhD279b37EnSICbKoSa4ZLGtI0K59zyA7at+H/lfQuPff3Y5qJF3R1nhvti
	 lklT+1K/yldj2aKGQqO4tixYxs+telr9jJYwULcPpW6CXhMotDCLsi7k2qVywwxF2
	 e8Kx6Pi1uIj7bi3ynZyqufKSmhP6tchkkox8D+CtZ2YUKb0y6DMuyubg3uAhOC4KX
	 yEd52PA+KsP7ZFUSRZoakMQM+MBNp70TqWmZByyrg04dsTXIP4J594FStCobS2Wss
	 2GaGKMi4p7gh0i/YEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.129] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1rfhpJ3j8f-00nxJm; Wed, 15
 Nov 2023 21:48:52 +0100
Message-ID: <812a82ee-c6e0-428e-9d21-b57d0c9d4839@gmx.net>
Date: Wed, 15 Nov 2023 21:48:51 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] staging: vc04_services: Add new vc-sm-cma driver
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 kernel-list@raspberrypi.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Ricardo B . Marliere" <ricardo@marliere.net>,
 Dan Carpenter <error27@gmail.com>
References: <20231109210309.638594-1-umang.jain@ideasonboard.com>
 <20231109210309.638594-2-umang.jain@ideasonboard.com>
 <5263ecbd-23af-4889-a7e0-b21aaf8bcfe0@i2se.com>
 <20231115195634.GC29486@pendragon.ideasonboard.com>
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20231115195634.GC29486@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qfn2JqbcbXXz7QP2FBfkhvhE3sTXpDE0e1uocwB3Xdsy21qJILC
 R/WbX3sNZHy6jysJ1Ba1owiBwBSTJ8Uy+VbaR2PhMGnYV3MMMrBhH90wFGiQxIDWJkKvtiv
 I7D3upHna7OxYLVpk1Or/920FkgWqPiXcMKASebv5hNSFrZBcFsatqRXYTljuCSnRr2nTY4
 vhfeGtI/SoSgPT1itQrcA==
UI-OutboundReport: notjunk:1;M01:P0:Lw6HBv/MQnM=;6fP67iXH68jiNribR9eADNMm1g4
 XXSsST18gbpE9Sr6OFFv/yBsH9zIby9U00WBOWCB5vO73ZD+HFZ29T9O2soAqy/PoXusiq7ZW
 d7vSNTxl/NEckM3oLE8o1+KGKUi7gLJE8fN+vr5CqI0QHJecYZlonUcifftPozBTrMohkMAwn
 0GSqErJdomVHD7/OUEq+Z12eVHz/saVimLqz2/OF2yHX//vrtdHWSKzg2cnYtxmgq33xR6ELX
 Ysa5xnN03TWFDrSaszoGcXvwyTJFzLUNIKrlkY+abr5G0J/uUp5DjnB6oLDhTWt2DfIG8esSc
 i+7JoY8x1yoTKBXdQJEbaplN/suncgvpe9SZNzI00fhe9r/363xP9Lfib0HBKJUvRPtI0Fg2s
 Ly5LPMbkFKfz4Ie4lUADQR8nhjIcm7CdW2VEw1fQzP+KdXhqpEHf8NZiCNp9gL3Enme5hcLvy
 HnzE2JBPmnof56q3AQ/WDU8ahw/SwQMY0gd6or/XP0pcsknk3md2Kq+IyNzhuH2t4VDuArW/b
 wGd/r4vPOvia6Z0yJXoBfBuTuMeWp4qCDojjUjY2mu4HegeAcqlqSeWlspOR6/1YSVJo1rG67
 Ntn0rwQSSB0ucQUxBU6YVy5qmwlM5owFMNF6O08hmb3h0lFzLE5EQ4kPyE6U8PZgyNZKrZTsC
 ysPGqdDXLpNgdApWXpz0V8YKZc3Rm9O+lfTbIJ9LtSW4PdZDuljGBynLTPF5dQUsSEDJDPMgj
 3o6V0bdI+/2gxzAIBvDHzzURySSfyDMuCriKuWKk1r3Mp/nvLcpa48h4C4WO0YlJkAgmsIQRE
 RnefuDPDhYZId11MyHSI22jkTsBIhVRN+DqYFM8UgdpJ5RjrIsPvbS5JxRS0btmhMixrUHhMg
 nrgTEV+tnqi/MwoiFObpYk0Wy4JJBd4/MSX47JM3v7xBo9DCf+K87LLGTk0dPbkRTTAykNet0
 1Pz4/KaxhTm0vN4K7Q+RN3EwJRA=

>
>>> +/* ---- Private Variables -------------------------------------------=
---- */
>>> +
>>> +static struct sm_state_t *sm_state;
>>> +static int sm_inited;
>>
>> In case the driver cannot be loaded again, a comment about this should
>> be here.
>
> Better, could we remove global variables ?

Yes

>
> [snip]
>

