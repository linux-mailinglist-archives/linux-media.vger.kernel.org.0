Return-Path: <linux-media+bounces-32323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A54AB45EB
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 23:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C92B97A194E
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 21:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DA6299924;
	Mon, 12 May 2025 21:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b="Hw8lElRy"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2090.outbound.protection.outlook.com [40.107.22.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F41DFDE;
	Mon, 12 May 2025 21:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083833; cv=fail; b=R6NGZJlEjHHUpw7xjjEL+CZEC09wfSMFXhtr6m4LEnf2APQ0PuDNWSZ5oXjPCwyzd21X86P40vSq3HfBI7JBHD36eqjrlulfeUbH84w2U1uNoqxvCcfuzWWLSVkcJNFR3s8H0EB5mETJZgHyL81pCAfRLbce9Kn7vCl0qbZirnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083833; c=relaxed/simple;
	bh=zHLN3jBMSiWBUThG9dnLI2ZIfPX6OlF90O/lmVSKbps=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VSi5rHuX4BVE5ZoBM0ofDro61YfQbd5qKGveNgxYFF0isN1IoEtWZzLL82pgMGNKDFN9VhiriItiBhmwfHZ9SNwakvabCJ0+Ak4AuId3Gn6UR7kUFyzHF7c1QXpIf3g2S8FrZNEt9caPD+kBdv9fdWCkMi/mgnw9wd9dSx4MQPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no; spf=fail smtp.mailfrom=neat.no; dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b=Hw8lElRy; arc=fail smtp.client-ip=40.107.22.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=neat.no
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGU2rWYqzlwrxlepwGsgrvC40DsnqBEawLsKM/3f3GL12LhnFai+H9NcsEXTR/Tvynb97eayvBYCzhjJ0sT47MYAZTbueqa8uIi60tQyr4guLcVxap4vloYQ0EqvoL0q5pefCPAPfR6473FsnP2gVeaE673juHprMj8U1nPmoJjzysSEXeMv/BPMTWZTr3qhcX3Tc8f0LAPOLmVkLNhJpuKNZLu7kaPjlYzMa18E+NH7ztRM7H8PVeYstRacQFDLGWSgMKkQkY3oApZy5sD+X32lu1oY4oA2sVKxETuFAcLoQJ6VklHHEW4mBltFMavapNyR0KcqPQWhw8CnHvZxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG9s93xsnjWW4Q7qawis1EJw5+RqW1KX3+kVL213nY4=;
 b=xWvq+O9lggAQriGVE/SEk354/xAdxJQ3UaQiGYYncEet/qb1i+2gAhPTZOkrsNnkR60K9AwDHTxljC8PY250LEQYviznysRf3+qdNqMXc643QRBWPqlEHFB0SV9Y2+2eq42RsqYb+4iTTJxZgAtU93ASI8aIWsXqbeqEjjCvD/rfpLH8NqzBBUhnPlrR6OAyyVEnPuYpaQ9RNVE9/kWz8iSpT2lwirfV9YZnv4I7WHWDDVBxi1+yivfT3dNedmrWDE9Ela3Q/SBBy9TicKJqu9gM6zRsKqmQuiUG8YVlRhZ9aI0dkUPjfJC0nysHerWNgpEXddU97iWqw+IXbV8pog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neat.no; dmarc=pass action=none header.from=neat.no; dkim=pass
 header.d=neat.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neat.no; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG9s93xsnjWW4Q7qawis1EJw5+RqW1KX3+kVL213nY4=;
 b=Hw8lElRybhnLDNl6u3bL0k4EMVuJV+/nNULAcfeC5oPrBUV6WJUVy27a7h5eDVD2JJ4pYxyVo3Nmsi+dpeSnEplf265DgcnY/2DO4NeGFZdZUL9oIpP87zOwPK7dDJIH7CTwCkJLQhe/uexr4eoIGXheULXNNjcUu9jL9oWgQN9ziucC2jUwHEMOOAfxmlQkl9fVSgH/sPS2kkwZL2P7IkWuuGdThuAWo/C2RxB/Qwpo4jYGxa5sI3NTL47BlWHf+pFmv93LEE8b0ATk4DpnpHrtl5SdYqIl3MZbkHeI7QE3NHxs+Kw0tNW9CSbJbR2tLxioJoIWHbFSyxz4dg66Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neat.no;
Received: from AM9P251MB0223.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:3df::24)
 by AS8P251MB0957.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:535::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 21:03:45 +0000
Received: from AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 ([fe80::f5d4:54a1:8303:1130]) by AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 ([fe80::f5d4:54a1:8303:1130%5]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 21:03:42 +0000
Message-ID: <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
Date: Mon, 12 May 2025 23:03:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
From: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, balbi@kernel.org, paul.elder@ideasonboard.com,
 kernel@pengutronix.de, nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
Content-Language: en-US
In-Reply-To: <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:3df::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0223:EE_|AS8P251MB0957:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de4c537-cf2a-4516-ee22-08dd91987a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czhkL3o2T05VNWNKS2pTT1NTeGpVTUZUWGsvL3ZvN0tkWXhxaUF6M01uYkJk?=
 =?utf-8?B?dEhXMVdLdTdDVUZUM0p5UXowckEvYWtXOUU4ZE9LZTdaRGIvYkpoV2w3OXJL?=
 =?utf-8?B?YnhxYmYzdlM0czlVTzBzVXpyZzJBUWhKcDJSeFpoVHhObUduVlNUTWpvM0py?=
 =?utf-8?B?MEVSbkd1SHRnaWRPZDNDaS9Lbytzb3gwNktSLzg2Y2JJcUlIbWo3di8rMWdm?=
 =?utf-8?B?dWxGc3REdXJ1ODJuK2xSanZ1eDZRNzVOSEllQzI3cXZmUStiSUYyZDJkcWEv?=
 =?utf-8?B?R01oYTRUNUtsQ0VZREUwYU9wTHlIbkN4NmNacjJ5emtvdm1iZUNsb2drNTRH?=
 =?utf-8?B?bmJUcXVsdDFwSkVXRVJrcTFFZml2dG4ybUJCWnlmeTVzQW5wU0QxSmkrTXkr?=
 =?utf-8?B?bzZ6dEZmcXYvdHRkYXF4YTJsL2swZWUzcDhWeVF6czR6anBrenNDVi9kbmdM?=
 =?utf-8?B?aE56NUhTZXJzUU9tVmlJTEVPQjFVVUdTZ1JoanVoVW5zaFY5TCtPbk1VVmwy?=
 =?utf-8?B?WVNmKzVhRnZ1UG9sa3ZIVmprdDdoNDVqZWlHeGg4Y3JGZXQ4MU5GbUV0dnZR?=
 =?utf-8?B?QUtFQTIyWEZBSU1kRzhKZ2g4UGU3cUJhODRGUnB4VHlMc3FjRnROenduWXJK?=
 =?utf-8?B?OUgxZzRpd2xKZGdXbmRaemtCRzRWaTkvN0pjMGRadldmYmQvYnkxeDkzZ1E3?=
 =?utf-8?B?Nlc4c0NKbnRyMWZvQnpmSnZSSDI1MEVEa1hCeEIvT2dmSWFHT2tNNDBPbHlH?=
 =?utf-8?B?RmJsbnFqVHEzQmQrWTE5cndEUitwdy9hY2JsNTlnRW9MTUZxdzMwNkoyS2VP?=
 =?utf-8?B?WFV6Q1FqeG1UeE9SK3R2bGgyL2czTk1OSkpIOGVyTi96TVBkeEZkSkt1Z0ln?=
 =?utf-8?B?b2tCUklobFN2dFVCOTNkL3BvblJxZDlJdTNVRjUwaHZRZnFMSnZJVEVtbk9p?=
 =?utf-8?B?Sm1hVmhITUtPdnVkd21xc0oyQWdKdUg2M2cySFpsa0RwQTZJNEhXMU5FMWdS?=
 =?utf-8?B?Sy9yWU9sU3pYYkZ0SVJocnEwam1USWdwQndEdUdmMkVhd1grWHdZdVBERUh1?=
 =?utf-8?B?SnBySEhVT2JKM3VBZmczbUxuUnlJcWZOWnV1VXlsWFFBUEJ6WmVaa2NKd1JH?=
 =?utf-8?B?aXBvOWlYOWx1TnI1WEFrQVBPM0ZMNWZrOTdGUjdRZE9lRXZSNmp1ZFgwY1g3?=
 =?utf-8?B?Yk9yZHZEbFByU3h6ZkNoZXJzenFOdEw3ZnRwSnRscmRyaDhpdmJ0cnJHM0Qy?=
 =?utf-8?B?Z1dFYkFGMnExSDNUTGtkUnNFVEQ4MnJRMTFjdDlMeHJYWjA2SlFDVWNOMHJG?=
 =?utf-8?B?VWdseG1QazJEUCtMSHZTQWhGTlJXZ2ZqNTdwTUdUSnlKcVNFUjNEaUJZdEdY?=
 =?utf-8?B?aG1MKytxQWw5eGlIQWZWY09QeUEyLzdPcWJRcjNGWmVOUkNnOWdGWHFrZkE5?=
 =?utf-8?B?VnVGbE5tRWpSN3FXS05XbVZpL3JyVlNxbVJtM2xiZDcxZHYwcTRpeUdSN0Vt?=
 =?utf-8?B?UjdiUU1zZ0NFVkJQUzV5OGpQODAyTjVOUFFocUdHcGlYbGk4WWw0TTl2RGNM?=
 =?utf-8?B?aDFBcDlnK3U2ZkdSQjU1Q29sSlU1RFFBZzFzMzUwRDFGNnQyKzZCT2tiVEdI?=
 =?utf-8?B?ZFM1THoyVThkUFFJNmlKdXRnZC91eThEZXArczN4YmxmZEx0Q09XeS9UTzg2?=
 =?utf-8?B?cXN3Vi9RZWZsZzlqMkhRRThQR3JhS1psb3owcU1jMUJha0NZdlR3ZVlsamhQ?=
 =?utf-8?B?RnhQS0RPYjJPRTVwU1VIWXEweG9yTzh2K201UmpGWmZ4TjhqTCtuOUlWdXpp?=
 =?utf-8?B?cmRTT3lzd0Nya2lyT0dWZ0duRFBkMXNqZ3RSR1MwamVvSFNLcUtzdlovYmFT?=
 =?utf-8?B?RmlTNEQvNmtKbm8wbjFab051c2hYQlk5c1Q2MjdKdllaRCswZTlKRWdOMS9V?=
 =?utf-8?Q?t8/hOKQQhtQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0223.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3JoanBaZmVpRVh3eG9OVkZzVStOQ1A1amFnZ3dTNFIvZXNRNFh3QzYvODQy?=
 =?utf-8?B?eDRIUEozY3VvdGZhcXcxWnlWNUxOV09TWGZiaUZNSE5FQzF1bkdjWGwzYmxS?=
 =?utf-8?B?K3R4b0VZa2U0MG82VW9IZkpGVkExcytKY0tWcDRzYzZYMmFZMTVwOTM1UTFh?=
 =?utf-8?B?Y0VCalZPUGVlenNicUo2S2ZZRnRvL0ZZTGt0VXpuWnpncWpVeFJXc1k2NEZW?=
 =?utf-8?B?T0k4blZoMU5ZVWJVT3NvM0grZFhpSld0ajNlYUFGbG4yMWVIZHcrNFFieEM0?=
 =?utf-8?B?Nm5mY3JnQkdQb0dRS1ZaZTcrT2JDb1VFTG4zWEZXbkpPb0RiZFRiRHhTTGp6?=
 =?utf-8?B?emg3TTY3bnh5T1Q1YWQ1eFZRWGxBeU9KRThWcjBzVW1YTkRLYzQwVXdFb0l1?=
 =?utf-8?B?ZzUrRHdpVGhlWTc1NFM5cUFUQ3ZuQk45RDNpWml5T1F4SnNuNXVUeTRQYStv?=
 =?utf-8?B?YTZkY01oVit2d01SYnlJVXBiVE9JeTZvUEEvNE1OZ1VvK0hQcDRnb0tWUkJi?=
 =?utf-8?B?QmhTMzhkZWZ3Rm1GSlZGMUw3Z2tmME5GdWg3dkEwdzdRNWluL3VFUUh6ODZv?=
 =?utf-8?B?OTZZbHlrZnRsblhuRjMwMFM0OStKbHZJWGYrbXFPVXZPRFEvNFZKWTZYZUJW?=
 =?utf-8?B?NEpUdWRza0xJOTdaMEVlajFOb2NZZXIrYWVSSHo1Q0JtNDI4V2hHTWIzQ0Ir?=
 =?utf-8?B?OHJobVd3Y3FSVXpVY2tzM2txcjIySTRCaE5jamU1Y3VJdWJvTFFGQnRQRnpm?=
 =?utf-8?B?bS9IYWNMK1RiUmkzYWo2cjd5L044cERUcmxkRjZWcUN5YVlqVERLTVFpanBI?=
 =?utf-8?B?ZllyMzV1SEhlZzl1M20yRTk3bm1yYndscWhSNXcrNUZqZXRaMEVrZ3dVOXhZ?=
 =?utf-8?B?MFhram10b3dVMGV2eitCNGRQRnVYSEhHRWZndHJGV3BORTFkUVhCeU1tWnc0?=
 =?utf-8?B?a2VybGxXc0JGc0t4VC9McUJJTE94MElqL0JLTkJVR051Z2ZrZzVaTkNtUXBC?=
 =?utf-8?B?OGdnMFoySHdMa3ErSFhpWHBzSytqL0xzbndZZzg5RTYyM0tmRXgwSXBzaGlZ?=
 =?utf-8?B?U3IrTGtmSHR2MzZBbGs5cENSL0dONmZqNi9vTzFOSTRMYVpLWXdJdG8wMmkx?=
 =?utf-8?B?TGtieXN2S2JXOHZySlNaNWpkQ013QkpZNVFlUTFzY2VpRmlRbmNsVmV6b0hl?=
 =?utf-8?B?UDhjTCs1aWcwNXZHd0FyREo1REJEQUJUSGlaRHZaQk5NUUJEUGlMeVZPdlAy?=
 =?utf-8?B?OEVjOW01eUdiYWFER3JaeGRiZHh4Ujc5bFJHdU5neE9sNG1OTDVFckpUYkFO?=
 =?utf-8?B?aVBsVk9qdXdkeGtIUFgyRU4zcmFuY3pPdUhzanBtakhWaGxpM0U2VFNUbVUz?=
 =?utf-8?B?b1BEdE05OUxWMGcxUjZvc1hnRWVkUTFZM0lFSnp4UG1mcEJzTzdwQ0p3Unpz?=
 =?utf-8?B?b2o5VlQwRmEraTcxc2VYR3pNbmJTT1ltVDYxR2tyejcwVWZzekR0MS9lSTIv?=
 =?utf-8?B?ZUVBclJybmR1RVRsemRmTHRWZjhEVXpUR0RXTXVHd0p6NUMvUGc0R2pvaFV1?=
 =?utf-8?B?Z3RVcjFQN29MOGRIdWo5THBJL1hLQW1jZmlXMVlWYS9CNjBhMldyR0JPOWdE?=
 =?utf-8?B?VzdpRDBxYjVkekFKc0pISmgyTEpxTUpUakVrd1RXN0w4THhzR3dQSWxKMVFx?=
 =?utf-8?B?Z3h0dHVKRlpNdEt5Q0lCbWQrL2t2QzdVNW0rQmFEOXluMG01L25RMjNWUWgv?=
 =?utf-8?B?Q1F5K1dDSjIybHZsTTRDdWZZQ3lDcVdXNy9zZ0tIMUdGeENMZ2NyZ0gxRTJl?=
 =?utf-8?B?R0tsczhoVVFta2tYSVU2M0x2Q0VBdXRtaGJMRUNvR3ZWSk5XTkdueFRRN2Yy?=
 =?utf-8?B?alN5Sk1DTHI1ck5mVVJNSUROaE1ISWo4UzRqVjVwR1JqdXV3bUFpQ0NEc3FZ?=
 =?utf-8?B?TkNHOHJFUHFwUzJEZDRKUVZUVkQwK3FNZVVIdm9MY3o0NWt6d3JoWTFuQjJj?=
 =?utf-8?B?NVE1SXFwR2hnTnZBNGxMditsR3h5MUI2V0x6S0l3Q00zL0pRN0FTRVVKMnA0?=
 =?utf-8?B?T1lTUStLKzRZTVhVRk5OVUdaSjkzdjBnUkR5c0hzek5GMmY0b1lPQnZ1M1lR?=
 =?utf-8?B?ZTNzUklHTkRNeWptL293N3RFZDRJWHpNN0E0RWU0Vm92bnZGRGRMZnM5MGhN?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: neat.no
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de4c537-cf2a-4516-ee22-08dd91987a15
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 21:03:42.7762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 029c40c7-2844-4bf3-9532-45d5eff8c8f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sEJGxAO/lHnud651v5DmxEJ0VPsOLKZ4BFTjscxMHhhhCgcQV2JUEt8WQjPJAb6QvM5S08cBMfaud+6Uiszy4ovOqa1G+o3wVX9xD/LBZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P251MB0957

On 12.05.2025 12:43, Krzysztof Opasiak wrote:
> On 12.05.2025 12:38, Greg KH wrote:
>> On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
>>> Hi Greg,
>>>
>>> On 4.12.2022 09:29, Greg KH wrote:
>>>> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>>>>> Hi Michael,
>>>>>
>>>>> On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
[...]
>>>
>>> Given that I'd like to suggest that it seems to actually make sense to
>>> revert this unless there are some ideas how to fix it.
>>
>> Sorry about this, can you submit a patch series that reverts the
>> offending commits?  As it was years ago, I don't exactly know what you
>> are referring to anymore.
>>
> 
> Sure! Will do.
> 

Would you prefer to have a set of actual reverts related to this:

da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in set_format"
20f275b86960 Revert "usb: gadget: uvc: fix try format returns on 
uncompressed formats"
059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in 
uvc_v4l2.c"
e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable again"

but have a negative consequence that the series isn't really bisectable 
from functional perspective. For example commit e6fd9b67414c breaks 
g_uvc until we apply da692963df4e so the series would have to go in as a 
whole.

Or you would prefer a single commit that technically isn't a revert but 
it just "undoes" the negative consequences of "usb: gadget: uvc: add 
v4l2 enumeration api calls" (kind of a squash of all commits above)?

Best regards,
-- 
Krzysztof Opasiak | R&D Team
neat.

