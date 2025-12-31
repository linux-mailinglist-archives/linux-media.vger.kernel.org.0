Return-Path: <linux-media+bounces-49799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA367CEBD67
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 12:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A11653009F53
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 11:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86C731283B;
	Wed, 31 Dec 2025 11:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="I6otxF0v"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020076.outbound.protection.outlook.com [52.101.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E72D7398;
	Wed, 31 Dec 2025 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179042; cv=fail; b=qo/IqNGwEeom8EV+FeKbsZFNa+61vGwK+9/45nEdXlSGVmwc0tY8wvwW5PYmDSFmkY+j3AaFA8s8EGaoXXYJhcB7Kx9mirxqD9S6cgs4+u12pMXWGO4SoiLje9SuJblqyFBjLdQVt0zzKI/f0WPlcgXoGjLDq7Vx2dasX9RTmeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179042; c=relaxed/simple;
	bh=Ydmv69Q73p0VCk3rTMN7hzQ9SqMeQ1TaqV2e3LN1+fE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ICGxBk+uD6ay6DqaHyjCpAzXKhSDXwtbiNNGNsoWm8nKp2AZ+WlIIXaCSRFObiPrEzboF6QrepNg0DEZjpE31+g4yvNarkRZrMIcca3Q7uDDXBvIWPOQANmjXssDP59sBmr8VXcyEggYGabwNlaWwFRu5cJCOeBMkKcfbMzSmOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=I6otxF0v; arc=fail smtp.client-ip=52.101.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DL7vhdljaMH1njixD0rVrZ9AFKtooVSti1Pg/6o9OnRhO0TFl1wAxrpLCZ9hlIrz5mRTLA5DC1gLYUlY73axJ/ASdDNA9umnfni5hdK6+qkPPGnEXkTqzoc17UEjx/kupxMWKUKnnYdg9NH/mraprgEXE5uF8UJYjIjwzu9D7oL8xiJAHiVs4JuMRAQGPGCxJyKcF6DuB3A6zAf1VGrpxSDfw096vxluQ64PloBjlLIwzHpLyATva1kryOcQvOypnf2p9fCjhyTUEeo0lbxli0OroOLs3Vx3186iLiH4+94asa+ZxitQYIKg8eNAkpkUTVufA+M3yccSYNQ/MnwzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ydmv69Q73p0VCk3rTMN7hzQ9SqMeQ1TaqV2e3LN1+fE=;
 b=YSi1M73sgH2KCA0NUFmhrAz/vhPfcp0lysNPMfcc/e0diB6HBDvEmoaW5Ar+T+AN4Ti/7oOJmDOMycbnTBy/YcAzbw/gFFn5nBATBtFdqjcZBUMFAaiNmMbFSz2SmrrhuU+Iuxt6pc31bILA1tp+RLbuSTAxM2JnYEHvc6FMyb4hWi5/oIENFeVunx+pk57l4z3dDYLQueiMkw9+3y1ynnCYiH5A0J6KosUrXY8nZ62evLsZBzg6y+zJRofyS65G0940MiAvK8rCVur1z+LLuyYGmOgomWZGJPA9rOjnlBPis1PyeBNi/gniOQAjQJw5+ezQ4a/i1fOkdgNCjdgImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ydmv69Q73p0VCk3rTMN7hzQ9SqMeQ1TaqV2e3LN1+fE=;
 b=I6otxF0vajz4wT2t+XHFXQNQ+tomexhmXf0I2N0cwv7VhmxtQb8JiMm55jev/tjL3p4FBW9wzFYQ9qW2FhUOf5aIEP8Xnpv8ZlEUxqaIgP4QG9IGxKE+w9gbIRpTNfVU4ezCIDKi53vQXDhJdYGnRUVWSUKJHR6pusoXU8s5WWPdD/X9BBviraT68CnDhVTlbkMaB8/ZlyAqSX0dGbiApBuTny8Vdm/V3mHb8P0pZ9qxd6lSYCMGo/FsapNXdBU7ZLTtuf9VgMfvyBuXQhJe3C5O3FCRrEnwpSkDBg7pQzckNWUn1VUgTATu30DyYzhf0YIPjJmQjiRw7U7G73U8cA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNZP287MB3948.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:289::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 11:03:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 11:03:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Xiaolei Wang <xiaolei.wang@windriver.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "johannes.goede@oss.qualcomm.com"
	<johannes.goede@oss.qualcomm.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: i2c: ov5647: switch to
 {enable,disable}_streams
Thread-Topic: [PATCH v3 3/3] media: i2c: ov5647: switch to
 {enable,disable}_streams
Thread-Index: AQHcejEoeNdA60GXTkqrF5+IkRdfmbU7k2Ho
Date: Wed, 31 Dec 2025 11:03:55 +0000
Message-ID:
 <PN3P287MB18293AE98858CE9B30DB6C0E8BBDA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
 <20251231083924.2657165-4-xiaolei.wang@windriver.com>
In-Reply-To: <20251231083924.2657165-4-xiaolei.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNZP287MB3948:EE_
x-ms-office365-filtering-correlation-id: fcbc3bc1-63fe-4d4d-0385-08de485c4aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c2VLRmV6RjltcXE1eHJmOEd1Ky9LdHh6eUVVRTZ1NEJGTEQxclV3VkFvUWdH?=
 =?utf-8?B?SU9DU01OMTI3N3FqcDdxa0orQVBZMk9ra3F1MGtVbWhkblI2SWlFaEZiM3Vj?=
 =?utf-8?B?WFU5cTVFMjZhS0YrWk4wenNUaVZES3RTT0lFdWdXVFh4eGt6eFNRSVoweG9k?=
 =?utf-8?B?UlpYR0dpTGttdlJ1R1NhR2lGazVpWG85QnUvRHB5WEt3a1d0a0pTN1gwelY1?=
 =?utf-8?B?MEdHNVlkQWdBM2lzMjVYeW83WVlLaFNxYVErbEJBZmZhQldjblIySUM2WDU5?=
 =?utf-8?B?S3F5WXBpaWVFaEM3UEJZVXpPZ1dkYUhvSjE4bVRLWGo2Q2h4dXkrS2NjMlpV?=
 =?utf-8?B?L0lCQ3UvWGx4Z1drY3BIMzArUC94OEhBTkxyWGIrUE1EVTZDZ21JVk0rcmJz?=
 =?utf-8?B?MlF3T21oVFlUR1liWEpoM25wNE9Kdi9NcGg3WlRsRkdtZnV3VlkvR3NZMkY0?=
 =?utf-8?B?QXd0YWMyUDg2TUJ4SXdiZFNVZDFKdVNZZnh1TmphWnNkTjJjdlRobDlSMVF5?=
 =?utf-8?B?QlFSR29DNG9sS3BGUDN0UmxlNStreUhKZVpqTzlpVzc4NUROOUsvQWRDS01q?=
 =?utf-8?B?TEJhNzA2VWlxZzU2a0kwck5PcnNpYTR6bGtkVldidzQ5ejZCc01Dejh5SC8r?=
 =?utf-8?B?UU90aWxGL0FiNWZZaU9KVDA4dVVRQUNtRXY2MysyQlhNTVF6VXNsYWRpSTY3?=
 =?utf-8?B?d0VISlNiajJjNlRhM084RkFDYzFsQWNJZ0RKcEdEZm1ZbWprbFRqblE4Z2xu?=
 =?utf-8?B?elpBQ21xaVgwS1BOSnpYa2VuR1JxNW94SW9aQVBKdTkxUVdmRkkzL3lOYTJ0?=
 =?utf-8?B?VE9DZWlsRTZLVUhJTm1BSGs4QUJBbVk4cnBTYnRYQ0NXTFhXWVF4SUlzUVp6?=
 =?utf-8?B?bWpTRVEwQU1NQjZoVG44T1RBYjFmZVdpOGh5cVBYa0s2dGdEV2YxSTZMRjMx?=
 =?utf-8?B?c3RsRDg1TFdGYTJwWWRhQ3R5c2p3NHR4KzBzZmw5d2VEdzZkWG85d3BWTXgr?=
 =?utf-8?B?d0gzMXlZYjBPZDJ1Nlh2L3RRQ0I2V1ZRWHZyYTUybU4yMk5zNVhlUzl0ZlNR?=
 =?utf-8?B?cTNSTWlFSlgzRXJxUDNzbTM1V3BCenFCbzk1OVQzMDN2ZWxXMUJydnV5bmZM?=
 =?utf-8?B?OFY2OWVWT01ITVB2QnFCR1ZHMHFidDZFVFRKb2RxWm9nTmhxS0ZVeUk5c2hn?=
 =?utf-8?B?b0ZOckJzQkM3aFFzSmx1R0RFTVgwbjZrN3NGSEUzMWZNVzNkUVg3Z29VcCt1?=
 =?utf-8?B?azY1N3FON1dhUXRoL1NMZ2hYb3V4d0dISURXN0ZlRlhhNTQyc0s5UEIrVE1h?=
 =?utf-8?B?b21MbXh6NHJFRDVVRmF5dWxoTXpPUEdFLzRzWFBhWDJNd0RETGs4blVBNUZM?=
 =?utf-8?B?T0F3d3YwSFpwOFZQWlovTHUzUU1BakYxTWhxRkdGcCtBUHBoQ3JSemg2cmdW?=
 =?utf-8?B?aE9lTXpNbDNqY3Zxb1p6bnJjamRxSGN0Tm9UVTdkaytPUHRSOWF2VnZENklO?=
 =?utf-8?B?SVR2WDlDbHdOTDZ0dDBjejBaR1hTbDB1SVdETlBBN1pOb296Skc1VnRQQWtF?=
 =?utf-8?B?aGFjNFlLdWNQVFk5RGlaUG5yR3JpTG05V2tRcEtzdUF5SVVjb0ZDYVhmSTRq?=
 =?utf-8?B?Mk9FaUVtaHRLMk9YYmpXckhsSjZtOGFPMk5RZUdkc2t4WFl4OVF1aVVDYktm?=
 =?utf-8?B?eUNUa25OUGlRMXZzVG5ndXdZWUJTU293THlmQmhnUjRNWmN5SVh2Wm9mQXZQ?=
 =?utf-8?B?bXVVbitxSGdmMUZZckJ4cGRhY0tEN1laRkJFRlFzSVNTOGNPZEQ5ekJFaHlZ?=
 =?utf-8?B?aEVkS0NnaTNLU0oyWXM3NzR0V1dvajRjWWdZN0E4S0FpeXNVQ3pEMWlUalBj?=
 =?utf-8?B?NGk4NStZQXVqTGFqamM0Vno4cXhpcDFBMGx3TjJHQVYyb2pkZTlvVHBSVDNE?=
 =?utf-8?B?ZTk0WndlVGxRUlRLUDVoRTVRK3lMTURWdXgyZUNuNEZrdzRpSnhNclJkYlhE?=
 =?utf-8?B?bzEyQWhVaEhGNnQ3RHlSeXd1bGRGa1FNMnh1UE9Ea2hNcjVSbWVBUkQyWHJQ?=
 =?utf-8?B?eDdFUTVkeGtHbC9oSURMZmZoN2g5VTlpRCsrUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UlJEbXd3eThsRE1VcEJwRmRmd05QbUdVSWM1eTQxbUtvNVJsaWZmZjFNVXZY?=
 =?utf-8?B?K2dlQ0w5TFFsOWFsTVJnTVRSaUJpTWhrQU8yRjNsNys3REJvUksrU1RNOE5Z?=
 =?utf-8?B?ZzBFNS8wa2FUMk04enI3a0x3U0d5OXZLS2UwanJRenROWjBsSTdVeXlXVDNU?=
 =?utf-8?B?RTk0SC96bjFVanFtSlArL2FwOSt4RzJINzZST2JMWEFWOGg0dnNzUXNqQitN?=
 =?utf-8?B?bGNvbjIyOGdFQzYrUVI0TDJ6c0FjQlpEcXI0YjBVZndYdXBkWUx0NjBKWjlV?=
 =?utf-8?B?dWRYdC80Ym9nUFBlTExaSnFKTDVCY3lUSVl2VW1sWlpSN3E3UTQrdlo0NjM3?=
 =?utf-8?B?SXpqY1dBODJNNEhBdFlWYXd1OXNMQm9sS21Pc3J4R2wyM05OSE1lWXcwcDhS?=
 =?utf-8?B?bU8wczlUUDNGRHd1RHFYRTFLejh2K3N4VFFFVDl3ZUNKRHZnRlJvMFRCUUl6?=
 =?utf-8?B?ZHVzV3lvNVFLSUh3ZExrYTExTERXZ2hSR2I2S1dGRGJkcnpyakc1WlNOVnc0?=
 =?utf-8?B?dkoyTndqOFFwZTEzdjZoS3BIMjVyUkNNME1XRGltT3NzRTN5WWtLQnhwZnVW?=
 =?utf-8?B?MGNoeDQzZXQrUlpXekJlRy8xVHcxUjRMdnRvemZGQnR5cTdQWVpTNzJLRlcw?=
 =?utf-8?B?S0ZJUXZWRTNiaWozd29YRFdSb2RNNDh3QVZZVDlFSk9YVUs4am5JbkdkK1pS?=
 =?utf-8?B?Y29Cd2wwcS9FUXM0QktrVXJNS0FqR2ZEczZUMi9KWSt1NmtQaXpaNEQwQ25Y?=
 =?utf-8?B?a0JraHh3ejBaK1NsbWdQdEpjL1lLQytaejhMZDB0QnJUdHBtUnhDdzNoMExs?=
 =?utf-8?B?dE44ZHozRGVxRjgrMDl3N05Pa216MWUraksvOU1oZERiNWhXaXJSTUtlM1hQ?=
 =?utf-8?B?VzdvQThhYlJGbnE2WXpJakl3bHBxbExIcFV2Q0p6Q1o4L1htTHFDRzZtL0x6?=
 =?utf-8?B?TEZXUTZCNjJ0bU03VVhVblU2ZmRBYTlVaFc5Qld2c3FLWWNoaHdzZWwrZEZs?=
 =?utf-8?B?c2wzbE9rRVcwS2xVQi81b3FtUXcvRjJPR0ZLNmZ2enRuUFU5TnRhVmNyem1s?=
 =?utf-8?B?TWdXbmxaVTVQNHk5MGxEU2JyM1k3SFRKUUFEV20zL0hhMlphSUMrMFlTcW5N?=
 =?utf-8?B?eDZpb0VmWWdyS3F2eWlybVVHNGpTLzZHWEgzUVR6OVNYajVKWG5xVDNFU0JU?=
 =?utf-8?B?bVY5TE9LYnVVU3FwV1E5dmZxRjllemtCSnpGS0I0YytsRW5ZekdaLythUlZo?=
 =?utf-8?B?YzI5RmZEZnFtUXFNbElNNUZHWmsrY3JJSFR2cWNUWlJUSERPWms4ZFdSNnRZ?=
 =?utf-8?B?V3ZtRUY5a04zMTlIalZ4WkR4WTgwWllUQU1md3JrcHdtMXoxZ3pEUGx3QlRq?=
 =?utf-8?B?a3R2V0xaTUh1ekF0WXVwaTcwbE1aSGtiWUw1WC94QXpLMEYxTHlXTzBwT3p4?=
 =?utf-8?B?K01TZ0dCaHY0MENMWEpGRzZFUkUxNG9Lb3JLdVIvTXIyb25GSTdNOGVMZi9G?=
 =?utf-8?B?MUk5N3NvUVZVV1U4eFNLYmV1Q1IyUVJLaktiOG1ZMjE0QS9xaEdkVFlPQ1Br?=
 =?utf-8?B?SExJMEVIb2VGSWtNSjZyRXVTd3hGQUxHMzZKSmZ4TnQ4N2VuTzZGellmNzFr?=
 =?utf-8?B?YmZNcFp3TXNYS0ZIWVBsMUh4WFMwNTR3V2N0ai9LZ0MxS3dpNTV3MDcrUkIx?=
 =?utf-8?B?SGpwOXlCc05jNUtHdjJleUVzWTFNUWM0QTBOS3BoNlNyVmhCL2lKK004NVpa?=
 =?utf-8?B?bEZWaDR0WDBSQWdQb3ZWL1I4VENuNHV3RjJKUS8wWkNBVVU5WTRuWjIyeVoz?=
 =?utf-8?B?T1ZGMGxXb2Yyc0VRbDhWYU9XbCtKbjlodDRWc3lWc1hHWmpPR2R2MXhqVDQ5?=
 =?utf-8?B?elpmN1VBVlNPWE9EdjdnQzk1MERDd3Ywd1MwUDJZTXBmMjZLa3YrZUMwcE9E?=
 =?utf-8?B?VHVuV3BoS09TekRBUi91NWgyNnVNVEJCaUxsS1M0SDI1aTg0QjVacnl6dlg2?=
 =?utf-8?B?Zk9xSWNFTk5FMnZXOC9raGhDS1dDRG56VGxPUEdrZzJJM041VzBYa25ONG84?=
 =?utf-8?B?dkNjYTdNMnY2dmVVTUJZTXZCUHh4eXpFWHdMclRDdGoxRlBxQXZiWUQzRHNW?=
 =?utf-8?B?a1NJU2RrZ2F1OXFCem5MK2dWWlVXakF5dUZQUFV1ZWhUdEcxRjVPWkRRVUJa?=
 =?utf-8?B?SmxNcXZxM0dUMmZhMTc5aTkvWFJSVW5kcjk1L3gyWDFreVh3Z0VGSUhkaDJZ?=
 =?utf-8?B?VGJLVjFCQzZTekMzcERLK1RaR2lzQlZQLzJYeUdLRE5oRGRNVm03SVcvSzRV?=
 =?utf-8?B?UE9PWDdTbThyNjd4TkFUOGIxbDBZdTAvbzhvcTNteWRESUExbG9UUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fcbc3bc1-63fe-4d4d-0385-08de485c4aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 11:03:55.9473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S3BW0E+H2jjoi04hAqd1KAuwbwXdDvlqBzHKOzaxDDj6wMzyTCQQKXUB8u395RiJ/KisbUTzNmkE1HDcAlNkuEb70cUY2HD+ko3dbyor9Xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZP287MB3948

SGkgWGlhb2xlaSwKCj4gU3dpdGNoIGZyb20gc19zdHJlYW0gdG8gZW5hYmxlX3N0cmVhbXMgYW5k
IGRpc2FibGVfc3RyZWFtcyBjYWxsYmFja3MuCj7CoAo+IFNpZ25lZC1vZmYtYnk6IFhpYW9sZWkg
V2FuZyA8eGlhb2xlaS53YW5nQHdpbmRyaXZlci5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiDCoGRy
aXZlcnMvbWVkaWEvaTJjL292NTY0Ny5jIHwgODkgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCA1MSBkZWxl
dGlvbnMoLSkKPsKgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0Ny5jIGIv
ZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQ3LmMKPiBpbmRleCBiYzgxZjM3ODQzNmEuLjcwOTEwODFh
MDgyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDcuYwo+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvaTJjL292NTY0Ny5jCj4gQEAgLTYzNywyMyArNjM3LDQyIEBAIHN0YXRpYyBp
bnQgb3Y1NjQ3X3NldF9tb2RlKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QpCj4gwqDigILigILigIJy
ZXR1cm4gMDsKPiDCoH0KPiDCoAo+IC1zdGF0aWMgaW50IG92NTY0N19zdHJlYW1fb24oc3RydWN0
IHY0bDJfc3ViZGV2ICpzZCkKPiArc3RhdGljIGludCBvdjU2NDdfc3RyZWFtX3N0b3Aoc3RydWN0
IG92NTY0NyAqc2Vuc29yKQo+ICt7Cj4gK+KAguKAguKAgmludCByZXQgPSAwOwo+ICsKPiAr4oCC
4oCC4oCCY2NpX3dyaXRlKHNlbnNvci0+cmVnbWFwLCBPVjU2NDdfUkVHX01JUElfQ1RSTDAwLAo+
ICvigILigILigILigILigILigILigILigILigIIgwqBNSVBJX0NUUkwwMF9DTE9DS19MQU5FX0dB
VEUgfCBNSVBJX0NUUkwwMF9CVVNfSURMRSB8Cj4gK+KAguKAguKAguKAguKAguKAguKAguKAguKA
giDCoE1JUElfQ1RSTDAwX0NMT0NLX0xBTkVfRElTQUJMRSwgJnJldCk7Cj4gK+KAguKAguKAgmNj
aV93cml0ZShzZW5zb3ItPnJlZ21hcCwgT1Y1NjQ3X1JFR19GUkFNRV9PRkZfTlVNQkVSLCAweDBm
LCAmcmV0KTsKPiAr4oCC4oCC4oCCY2NpX3dyaXRlKHNlbnNvci0+cmVnbWFwLCBPVjU2NDBfUkVH
X1BBRF9PVVQsIDB4MDEsICZyZXQpOwo+ICsKPiAr4oCC4oCC4oCCcmV0dXJuIHJldDsKPiArfQo+
ICsKPiArc3RhdGljIGludCBvdjU2NDdfZW5hYmxlX3N0cmVhbXMoc3RydWN0IHY0bDJfc3ViZGV2
ICpzZCwKPiAr4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCCIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc3RhdGUsIHUzMiBwYWQs
Cj4gK+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAgiB1NjQgc3RyZWFtc19tYXNrKQo+IMKgewo+IMKg4oCC4oCC4oCCc3RydWN0IGky
Y19jbGllbnQgKmNsaWVudCA9IHY0bDJfZ2V0X3N1YmRldmRhdGEoc2QpOwo+IMKg4oCC4oCC4oCC
c3RydWN0IG92NTY0NyAqc2Vuc29yID0gdG9fc2Vuc29yKHNkKTsKPiDCoOKAguKAguKAgnU4IHZh
bCA9IE1JUElfQ1RSTDAwX0JVU19JRExFOwo+IMKg4oCC4oCC4oCCaW50IHJldCA9IDA7CgpObyBu
ZWVkIGZvciB6ZXJvIGluaXRpYWxpemF0aW9uLgrCoMKgCj4gK+KAguKAguKAgnJldCA9IHBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQoJmNsaWVudC0+ZGV2KTsKPiAr4oCC4oCC4oCCaWYgKHJldCA8
IDApCj4gK+KAguKAguKAguKAguKAguKAguKAguKAguKAgnJldHVybiByZXQ7Cj4gKwo+IMKg4oCC
4oCC4oCCcmV0ID0gb3Y1NjQ3X3NldF9tb2RlKHNkKTsKPiDCoOKAguKAguKAgmlmIChyZXQpIHsK
PiDCoOKAguKAguKAguKAguKAguKAguKAguKAguKAgmRldl9lcnIoJmNsaWVudC0+ZGV2LCAiRmFp
bGVkIHRvIHByb2dyYW0gc2Vuc29yIG1vZGU6ICVkXG4iLCByZXQpOwo+IC3igILigILigILigILi
gILigILigILigILigIJyZXR1cm4gcmV0Owo+ICvigILigILigILigILigILigILigILigILigIJn
b3RvIGRvbmU7Cj4gwqDigILigILigIJ9Cj4gwqAKPiDCoOKAguKAguKAgi8qIEFwcGx5IGN1c3Rv
bWl6ZWQgdmFsdWVzIGZyb20gdXNlciB3aGVuIHN0cmVhbSBzdGFydHMuICovCj4gwqDigILigILi
gIJyZXQgPSDCoF9fdjRsMl9jdHJsX2hhbmRsZXJfc2V0dXAoc2QtPmN0cmxfaGFuZGxlcik7Cj4g
wqDigILigILigIJpZiAocmV0KQo+IC3igILigILigILigILigILigILigILigILigIJyZXR1cm4g
cmV0Owo+ICvigILigILigILigILigILigILigILigILigIJnb3RvIGRvbmU7Cj4gwqAKPiDCoOKA
guKAguKAgmlmIChzZW5zb3ItPmNsb2NrX25jb250KQo+IMKg4oCC4oCC4oCC4oCC4oCC4oCC4oCC
4oCC4oCCdmFsIHw9IE1JUElfQ1RSTDAwX0NMT0NLX0xBTkVfR0FURSB8Cj4gQEAgLTY2MywxOSAr
NjgyLDI0IEBAIHN0YXRpYyBpbnQgb3Y1NjQ3X3N0cmVhbV9vbihzdHJ1Y3QgdjRsMl9zdWJkZXYg
KnNkKQo+IMKg4oCC4oCC4oCCY2NpX3dyaXRlKHNlbnNvci0+cmVnbWFwLCBPVjU2NDdfUkVHX0ZS
QU1FX09GRl9OVU1CRVIsIDB4MDAsICZyZXQpOwo+IMKg4oCC4oCC4oCCY2NpX3dyaXRlKHNlbnNv
ci0+cmVnbWFwLCBPVjU2NDBfUkVHX1BBRF9PVVQsIDB4MDAsICZyZXQpOwo+IMKgCj4gK2RvbmU6
Cj4gK+KAguKAguKAgmlmIChyZXQpCj4gK+KAguKAguKAguKAguKAguKAguKAguKAguKAgnBtX3J1
bnRpbWVfcHV0KCZjbGllbnQtPmRldik7Cj4gKwo+IMKg4oCC4oCC4oCCcmV0dXJuIHJldDsKPiDC
oH0KPiDCoAo+IC1zdGF0aWMgaW50IG92NTY0N19zdHJlYW1fb2ZmKHN0cnVjdCB2NGwyX3N1YmRl
diAqc2QpCj4gK3N0YXRpYyBpbnQgb3Y1NjQ3X2Rpc2FibGVfc3RyZWFtcyhzdHJ1Y3QgdjRsMl9z
dWJkZXYgKnNkLAo+ICvigILigILigILigILigILigILigILigILigILigILigILigILigILigILi
gILigILigILigILigILigILigIIgwqBzdHJ1Y3QgdjRsMl9zdWJkZXZfc3RhdGUgKnN0YXRlLCB1
MzIgcGFkLAo+ICvigILigILigILigILigILigILigILigILigILigILigILigILigILigILigILi
gILigILigILigILigILigIIgwqB1NjQgc3RyZWFtc19tYXNrKQo+IMKgewo+ICvigILigILigIJz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRfc3ViZGV2ZGF0YShzZCk7Cj4gwqDi
gILigILigIJzdHJ1Y3Qgb3Y1NjQ3ICpzZW5zb3IgPSB0b19zZW5zb3Ioc2QpOwo+IC3igILigILi
gIJpbnQgcmV0ID0gMDsKPiAr4oCC4oCC4oCCaW50IHJldDsKPiDCoAo+IC3igILigILigIJjY2lf
d3JpdGUoc2Vuc29yLT5yZWdtYXAsIE9WNTY0N19SRUdfTUlQSV9DVFJMMDAsCj4gLeKAguKAguKA
guKAguKAguKAguKAguKAguKAgiDCoE1JUElfQ1RSTDAwX0NMT0NLX0xBTkVfR0FURSB8IE1JUElf
Q1RSTDAwX0JVU19JRExFIHwKPiAt4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCIMKgTUlQSV9D
VFJMMDBfQ0xPQ0tfTEFORV9ESVNBQkxFLCAmcmV0KTsKPiAt4oCC4oCC4oCCY2NpX3dyaXRlKHNl
bnNvci0+cmVnbWFwLCBPVjU2NDdfUkVHX0ZSQU1FX09GRl9OVU1CRVIsIDB4MGYsICZyZXQpOwo+
IC3igILigILigIJjY2lfd3JpdGUoc2Vuc29yLT5yZWdtYXAsIE9WNTY0MF9SRUdfUEFEX09VVCwg
MHgwMSwgJnJldCk7Cj4gK+KAguKAguKAgnJldCA9IG92NTY0N19zdHJlYW1fc3RvcChzZW5zb3Ip
Owo+ICsKPiAr4oCC4oCC4oCCcG1fcnVudGltZV9wdXQoJmNsaWVudC0+ZGV2KTsKPiDCoAo+IMKg
4oCC4oCC4oCCcmV0dXJuIHJldDsKPiDCoH0KPiBAQCAtNzA2LDcgKzczMCw3IEBAIHN0YXRpYyBp
bnQgb3Y1NjQ3X3Bvd2VyX29uKHN0cnVjdCBkZXZpY2UgKmRldikKPiDCoOKAguKAguKAgn0KPiDC
oAo+IMKg4oCC4oCC4oCCLyogU3RyZWFtIG9mZiB0byBjb2F4IGxhbmVzIGludG8gTFAtMTEgc3Rh
dGUuICovCj4gLeKAguKAguKAgnJldCA9IG92NTY0N19zdHJlYW1fb2ZmKCZzZW5zb3ItPnNkKTsK
PiAr4oCC4oCC4oCCcmV0ID0gb3Y1NjQ3X3N0cmVhbV9zdG9wKHNlbnNvcik7Cj4gwqDigILigILi
gIJpZiAocmV0IDwgMCkgewo+IMKg4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCZGV2X2Vycihk
ZXYsICJjYW1lcmEgbm90IGF2YWlsYWJsZSwgY2hlY2sgcG93ZXJcbiIpOwo+IMKg4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCCZ290byBlcnJvcl9jbGtfZGlzYWJsZTsKPiBAQCAtODAzLDQ3ICs4
MjcsOCBAQCBfX292NTY0N19nZXRfcGFkX2Nyb3Aoc3RydWN0IG92NTY0NyAqb3Y1NjQ3LAo+IMKg
4oCC4oCC4oCCcmV0dXJuIE5VTEw7Cj4gwqB9Cj4gwqAKPiAtc3RhdGljIGludCBvdjU2NDdfc19z
dHJlYW0oc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwgaW50IGVuYWJsZSkKPiAtewo+IC3igILigILi
gIJzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRfc3ViZGV2ZGF0YShzZCk7Cj4g
LeKAguKAguKAgnN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc3RhdGU7Cj4gLeKAguKAguKAgmlu
dCByZXQ7Cj4gLQo+IC3igILigILigIJzdGF0ZSA9IHY0bDJfc3ViZGV2X2xvY2tfYW5kX2dldF9h
Y3RpdmVfc3RhdGUoc2QpOwo+IC0KPiAt4oCC4oCC4oCCaWYgKGVuYWJsZSkgewo+IC3igILigILi
gILigILigILigILigILigILigIJyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCZjbGll
bnQtPmRldik7Cj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAgmlmIChyZXQgPCAwKQo+IC3i
gILigILigILigILigILigILigILigILigILigILigILigILigILigILigIJnb3RvIGVycm9yX3Vu
bG9jazsKPiAtCj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAgnJldCA9IG92NTY0N19zdHJl
YW1fb24oc2QpOwo+IC3igILigILigILigILigILigILigILigILigIJpZiAocmV0IDwgMCkgewo+
IC3igILigILigILigILigILigILigILigILigILigILigILigILigILigILigIJkZXZfZXJyKCZj
bGllbnQtPmRldiwgInN0cmVhbSBzdGFydCBmYWlsZWQ6ICVkXG4iLCByZXQpOwo+IC3igILigILi
gILigILigILigILigILigILigILigILigILigILigILigILigIJnb3RvIGVycm9yX3BtOwo+IC3i
gILigILigILigILigILigILigILigILigIJ9Cj4gLeKAguKAguKAgn0gZWxzZSB7Cj4gLeKAguKA
guKAguKAguKAguKAguKAguKAguKAgnJldCA9IG92NTY0N19zdHJlYW1fb2ZmKHNkKTsKPiAt4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCaWYgKHJldCA8IDApIHsKPiAt4oCC4oCC4oCC4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCZGV2X2VycigmY2xpZW50LT5kZXYsICJzdHJl
YW0gc3RvcCBmYWlsZWQ6ICVkXG4iLCByZXQpOwo+IC3igILigILigILigILigILigILigILigILi
gILigILigILigILigILigILigIJnb3RvIGVycm9yX3BtOwo+IC3igILigILigILigILigILigILi
gILigILigIJ9Cj4gLeKAguKAguKAguKAguKAguKAguKAguKAguKAgnBtX3J1bnRpbWVfcHV0KCZj
bGllbnQtPmRldik7Cj4gLeKAguKAguKAgn0KPiAtCj4gLeKAguKAguKAgnY0bDJfc3ViZGV2X3Vu
bG9ja19zdGF0ZShzdGF0ZSk7Cj4gLQo+IC3igILigILigIJyZXR1cm4gMDsKPiAtCj4gLWVycm9y
X3BtOgo+IC3igILigILigIJwbV9ydW50aW1lX3B1dCgmY2xpZW50LT5kZXYpOwo+IC1lcnJvcl91
bmxvY2s6Cj4gLeKAguKAguKAgnY0bDJfc3ViZGV2X3VubG9ja19zdGF0ZShzdGF0ZSk7Cj4gLQo+
IC3igILigILigIJyZXR1cm4gcmV0Owo+IC19Cj4gLQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCB2
NGwyX3N1YmRldl92aWRlb19vcHMgb3Y1NjQ3X3N1YmRldl92aWRlb19vcHMgPSB7Cj4gLeKAguKA
guKAgi5zX3N0cmVhbSA94oCC4oCC4oCC4oCC4oCC4oCC4oCCb3Y1NjQ3X3Nfc3RyZWFtLAo+ICvi
gILigILigIIuc19zdHJlYW0gPSB2NGwyX3N1YmRldl9zX3N0cmVhbV9oZWxwZXIsCj4gwqB9Owo+
IMKgCj4gwqBzdGF0aWMgaW50IG92NTY0N19lbnVtX21idXNfY29kZShzdHJ1Y3QgdjRsMl9zdWJk
ZXYgKnNkLAo+IEBAIC05ODYsNiArOTcxLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX3N1
YmRldl9wYWRfb3BzIG92NTY0N19zdWJkZXZfcGFkX29wcyA9IHsKPiDCoOKAguKAguKAgi5zZXRf
Zm104oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCPSBvdjU2NDdfc2V0X3BhZF9mbXQsCj4g
wqDigILigILigIIuZ2V0X2ZtdOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgj0gb3Y1NjQ3
X2dldF9wYWRfZm10LAo+IMKg4oCC4oCC4oCCLmdldF9zZWxlY3Rpb27igILigILigILigILigILi
gILigILigILigILigII9IG92NTY0N19nZXRfc2VsZWN0aW9uLAo+ICvigILigILigIIuZW5hYmxl
X3N0cmVhbXPigILigILigILigILigILigILigILigILigII9IG92NTY0N19lbmFibGVfc3RyZWFt
cywKPiAr4oCC4oCC4oCCLmRpc2FibGVfc3RyZWFtc+KAguKAgj0gb3Y1NjQ3X2Rpc2FibGVfc3Ry
ZWFtcywKPiDCoH07Cj4gwqAKPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9zdWJkZXZfb3Bz
IG92NTY0N19zdWJkZXZfb3BzID0gewo+IC0twqAKPiAyLjQzLjAKClJldmlld2VkLWJ5OiBUYXJh
bmcgUmF2YWwgPHRhcmFuZy5yYXZhbEBzaWxpY29uc2lnbmFscy5pbz4KwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqDCoApCZXN0IFJlZ2FyZHMsIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAKVGFyYW5n

