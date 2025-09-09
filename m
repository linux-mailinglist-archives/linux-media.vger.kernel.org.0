Return-Path: <linux-media+bounces-42053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09188B4A039
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 05:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 401EB7AC289
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 03:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92272737FD;
	Tue,  9 Sep 2025 03:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="HLyET0dN"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022077.outbound.protection.outlook.com [40.107.43.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA927AC4D;
	Tue,  9 Sep 2025 03:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757389508; cv=fail; b=btk9EgBYpRhd8mfI4QWg9mgilXI1gJTQxHJHBtB+9kShW+lsuGO5hJzFJXozmWVnlI+mmpN4ANzuk87ETlTueoV6S2QaTQ0gwmrLAvwn4wyupMEWT0+Gf0bQdt8DXq0ix9idhvo7cblYSwQ4lIEmRYG0FakHAOk30L4S4o0PR04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757389508; c=relaxed/simple;
	bh=L2zYKNCasH2zXs8qoR/O7tJdGgOFYjKcdsey5PzhZEY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kv8f3HWZkpJu+jxSF7MhNxsFF4rG6BBNypeqqt0jTZcQ9CzvJm3m/jLJwmrTW8r/JJBQ1YZdii/U9yhiDg8KRhDWdwtsgIOo82kejUHPf5N/gitB2VCuogIkAstuGWjdyXRMzjSHJfkwZzEufNYW3qhZ+Wja0Lo7cCW0fcjhMew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=HLyET0dN; arc=fail smtp.client-ip=40.107.43.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4oToRhcd4VJeQrhhdoeadczSorQWnDv1Oy80YvJfAYdObv6Oc3jXm43E9fPf1z0FJcs63fp3xjpL1kI0zuZSd94AdAbS0j7Ck3Iutwdvq54moDugxRHMt830orAIZ+EGFZLjZOKRZEVyIav/byOsnEsa6/4Ugi4elHBg7GPd62hJBGAzusuLXytPjdOzRScQ4rRH+D7EWs7AhTsF2BNO61dYxKS+hqTRCNANUo7kCE+fQjnob0c/Fdah/SIonHSsxKexJMGtrrehDNqgpvH+7cH6uvUgq1vOZdDDexj50Pyk+k0r9XeibfpXEeVF8hI5dngocsjkvhSUTmJB8Gnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2zYKNCasH2zXs8qoR/O7tJdGgOFYjKcdsey5PzhZEY=;
 b=ylBoSLrFAFzPwgcoNV2/X3Th414kAEGnza6u2UpClOyCcSwPziywjL28IrCGP8s0xLwghTz/ibiOpzv4vB0RVfige47oj4KbdgURIoRZfFPVP8tqorEpgFWOSvvTiSoql3RR57tgI2t6fNXrkSTkr+Z694aQPqbdYj11L8bnejxTT8NozEl21IvOw8kEzPqzeyr+a7l2K0QFRCZfmbhQFcSXnW0xVGQtJD1sxpIK5IEGY4+Dz1XQvIxwocTVLW19kaAJMPmZU7/aj3JEwQt9KDKEdapfwookLdfQ9O8RO93D2CnZ4Uz0K98CUZxti9UR2EPxTGjveJ73ymOoilA7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2zYKNCasH2zXs8qoR/O7tJdGgOFYjKcdsey5PzhZEY=;
 b=HLyET0dNmxABS4VlutzzzKF6tgf6pInJfBmFalKY87hEzfNU9xwQNchUgpeQujGMyNoZ4wlPDzsXSQuj/lSEOT98r0W2fbi+4q26xd43A63DMyudfUiP2Bs8GwgRLqKQ1iFM2qagH5qsj5vK4ftJTpDcghBi0MKEe3mkGVIKO0U=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SL2P216MB2799.KORP216.PROD.OUTLOOK.COM (2603:1096:101:283::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.15; Tue, 9 Sep 2025 03:45:03 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%3]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 03:45:03 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v3 3/4] media: chips-media: wave5: Add WARN_ON to check if
 dec_output_info is NULL
Thread-Topic: [PATCH v3 3/4] media: chips-media: wave5: Add WARN_ON to check
 if dec_output_info is NULL
Thread-Index: AQHb49TZHJGzDxiGE0OxsI11WMdbk7R6WjAAgBBWPgA=
Date: Tue, 9 Sep 2025 03:45:03 +0000
Message-ID:
 <SLXP216MB114899ECD3324544787DA6A3ED0FA@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20250623002153.51-1-jackson.lee@chipsnmedia.com>
	 <20250623002153.51-4-jackson.lee@chipsnmedia.com>
 <88fc40c386f2609584df72cf4951972b07f20e72.camel@collabora.com>
In-Reply-To: <88fc40c386f2609584df72cf4951972b07f20e72.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SL2P216MB2799:EE_
x-ms-office365-filtering-correlation-id: cf70ca14-c742-4bec-faa7-08ddef5342d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?K3NJdC93N0I2R3EwcHNFeXA5YWVsWDY4bGZqYTdmMy9DdXlScWFxNEhyMllV?=
 =?utf-8?B?ZkRwRDFFSVZRTUptSCtySlZwczI2c3VKdGxuRHIrRHZBL1RzTVFWSnk3WVBO?=
 =?utf-8?B?Wkk2V2ltek93TWFlM1QvUGlvak9kWVVjTnppTG1iTkpMQjNod2NXZElpZzVr?=
 =?utf-8?B?S2hlYUFVN0Q1TktNNlErSWl6Snd3ZElpUFlMTzMzMHptTEl5c2dSYmhab21G?=
 =?utf-8?B?blppOVJOWGRrWkY5QXNnMUVweEJBY21xWmFSMTk3S3RkQ2dHK2E3b2p1ZGlm?=
 =?utf-8?B?UTVXVFFkQVk2VEliOHgzTlovekxyVEM1bDhZeXdWVldqdTFhTkRaMzFablBm?=
 =?utf-8?B?K3ROV3FBZFlwQy9OZkxmSGVWK2xWS3F2cGFUdTI1b281aWxZNGh5cDRqdDBX?=
 =?utf-8?B?aUJNeDdUait1eDlXajR1WVJyeEE5U1RTRFFVenlmTHV1b3o1bXBrcENZbWEv?=
 =?utf-8?B?Y2N4L3JZU2s0dUd2TWJhMTQ0R2tTbk1XaTU4TDBhTUN1NnptQ3FnRjkwSXNa?=
 =?utf-8?B?bUM0cXlTRnY1aTZJSVhMdmRhRU4xOUNGZWMzVDJCL1BUUjgzeFJZUWM2dndE?=
 =?utf-8?B?NG5BM0pqZUxhdFJWcnFsckNJSzVFQlpZQWhhL3pLYThCREd3cE9BaUJlWTlR?=
 =?utf-8?B?UFF0eXpTMzBBRFRmRmlwc2dHT2RYNEoxOWxtMlhPY01ZRTEzbHRMYzk3V21l?=
 =?utf-8?B?T0tFQlBaTlgyRjNaV0dwSjhYc0F2aDZYalh2QW5xWURmTmwxMVZzTkpNcS94?=
 =?utf-8?B?ckRJc0cxZElWb3RIOTlqZUZLZHhMcURxUk1qSExvUk1tcE0xZ2VISmdUaHZ5?=
 =?utf-8?B?bis3QzVxd01sSUFOb1JhY1V2MTluYktrWm5IdUlnMHg3ZWk5akRBM3kyQTl0?=
 =?utf-8?B?TEVzaVlzYXBGUVdpYUJ6eEp3RFdqR0t0c0xMZldtdDJoMFdZTEFHWGZIajNX?=
 =?utf-8?B?K0tqT2xyZ2MwVGIwbHBqNmZJcXNNN3A3SzVIRFJvYTFGdS9nV096ajN6NkhS?=
 =?utf-8?B?N3lHTXRYOTZiYyt2ZkUxU2RaNnJJSiswQk9aSDhHWFgrQWpJc3JYTmc0d2ox?=
 =?utf-8?B?VmJEeWxKQWhUdnpmYmFBWEdNR3VzaEswODR1SFMvWUZ1Q1ZpUEl4bzJFakxl?=
 =?utf-8?B?eENDbmlicGVkbVFFVTAvMTc3RHNZMU45SU9XRzFaaWZwRTUrcjFOU3NVV3pM?=
 =?utf-8?B?QkZ6Y0N2Zlo4WVZUaFRzSkhMSVgxbGN6cTV1NDkyNjVSS1FML1Q1dlduTkhm?=
 =?utf-8?B?c0RhcXhDUGhNcytmU3dBaVByUXE5L2hJVXEvdXJ6RWF6Qy9kNzAvZ1Y4Kzli?=
 =?utf-8?B?Y3ZCamtZL2FVaVRGK0dFU0pYbUk2L1p2Sy8vM1JaNjN5RWxOdlVFTG1Tb2R3?=
 =?utf-8?B?anJ1dnhxRkpVVTl3M2N3QWlDaWpKYjNuWVhpQWxXdWV0SGVLNUIzWExneG15?=
 =?utf-8?B?MVY5akNyQWFob0J5a29PZGFLbXpyV2FPZW05Z3lRa0FxNTVWUko2RUEvdDNa?=
 =?utf-8?B?OURSK0taNkYzazNnTXlGcHoxZlBPSkZTeUt6TnNVeHJsRG1kRWk5bVo1Rmtv?=
 =?utf-8?B?UkIwRXNIenBmQ0hoY0pPbVlXdE1URWt1eUR3RGw3WG9SbUZUcUg0RkFyWWN6?=
 =?utf-8?B?aTQ2dmpTNnd5bDU0bjZ3TFBxQ2ZtRlFORUd3ZUtadDR0UUJpQTY0RWVMSDk5?=
 =?utf-8?B?UStVd1BUOElXaGRwRTRSTU1PZWt6Qnc4RFJrTUQ2MjloYkpvSExhT0RtUTBa?=
 =?utf-8?B?Z2MrZWRURG13QmN4Z1JrRVN5OEpIVm5hY0w1Mk8xK2huV1ZRRHVnMS9pZFNI?=
 =?utf-8?B?T0Foa2FVSTZqMVJobUhlZ2lqaVNpdHBJU2ZWWi9oaUdnbzliS2xKVWpIRGh2?=
 =?utf-8?B?T000YXoyQ2cyTk5STFE3UEgwZWhDNFk4cis0VE9jMTFaU3h3czJJcUthczZP?=
 =?utf-8?B?WWRteHNhdWRNRHEzZ0U4SGRDaUFCQTB6Z2I2MnIzd2ZKS3M5bStJbzRGRzZE?=
 =?utf-8?B?cFJGSnpsMXF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0REUUI1S3pOVFU4V1RuRkx2cEVzQ0FheThKdzR5V3Zpc0NXVlFjRGxGaWIz?=
 =?utf-8?B?Q2ZiYk00S2J0ckZFQk5rOHdoeENIYWsrNWYyZUxnVzZVQkhoc0I2OW9kWWlB?=
 =?utf-8?B?bkdSaC9oWUt4eE9sdjZCSDBDTGI0a1hMN3FFR3F0TE15ME1FcEhFTzRSbTF6?=
 =?utf-8?B?cjRkNkdvVW9IWSsyR2JwOWxCdmN0MXdzMTBnQnVMWCtIRllBODVNVlJaMjdI?=
 =?utf-8?B?YlhRUHZCUUtaNXZJNUlIa2JyL3pNZ0JvMERDTGNoUHVlRGRXK3N4M2VjSnpF?=
 =?utf-8?B?SFYvbGVYMHhJcVRWRE10cFBjd1lRMkNCVGR5WFoyNFBZVjc0WEVTVzlLeU9q?=
 =?utf-8?B?aFArU3RrTU1yTkhqaUduRmtVbjF4c3hza1BJa2RvYmtRSGxsWUg3bVRiM1E1?=
 =?utf-8?B?UEFjQjA5b3l1M0p4Qk84YkhvOWxIOU5Cd1o0dmFCc0cyKzM3Qm1jS2VOeE50?=
 =?utf-8?B?TmlDZmtUaVBjbzRCMWllbFNxczhMV1pKbUJOZ1d4a045VlBUS1FNYXFmdmU4?=
 =?utf-8?B?MWNiVGthd2FNOGk5YTBibXdtWlRqY3VSVXlGSCtXVGVyNkdFR2pXdWR0WEc3?=
 =?utf-8?B?WlliUkkrRVdEY2Q2WVN3OEJsNzIyaGgvUVpQT2M1RGN1UDZUYkJ1azJRbVp0?=
 =?utf-8?B?dTc4ZS9FL1BLVU1ucVllVG5HN2kxZzV4ZFYvaGVqYVN0b2k3L0dFTVlCWlNT?=
 =?utf-8?B?dFFSdFFNTExsR01tcDZFSkdWZkg2Vy80dldVTDgrc3pYenVSRGNoK2FGNUJH?=
 =?utf-8?B?Rkw1S3FpdGduMEF6eTlFNWM5SzBJdzNuYm1yYXNDRitmdWNVbXdFdFBEVEsz?=
 =?utf-8?B?QytYRUtvQWlLK01GSVd2U0ZvdnhtTHAveHdQTFFyRFhaZmlma1VzMXVsYkIy?=
 =?utf-8?B?VzN3K01NMFVEYkd4MmZMNEdBTmMrYjFFL3dHM1RTVGMwVDlyeXNnQng0UDc4?=
 =?utf-8?B?WnpDOUdycS85NFNXM29ya1NrUHJhTGQ5Rk9yRXd3WlVUZUp0dVJrYlVWVlFX?=
 =?utf-8?B?SWNIMlBsVWo2ZUFFY21TTzExOEhjeEFueXZWVmVyWjhaZFAxbTlRZllDU3Aw?=
 =?utf-8?B?c1pLMDFtNjBabzNzaDFQQ3QxUWVpenRjQlR1ZXhpSDZrYXpqTjBvLzR5S2F1?=
 =?utf-8?B?MURYcWIrUGZUd2RKQ1ZCUnJKWHRDOVk4YlF6WFh5TE5GYmNuMXhlUitJYVlL?=
 =?utf-8?B?WkJiU05nLzJxUUw0LzNRVjMwTWZtQjNUTW9Eb29kUE9zVVhRRmlwYUs5Rzc4?=
 =?utf-8?B?dHBBYnNvT1l5ekxIVHd3RTJUYXJ3OVhBSngzTmRsK3F4eXBpTVpDaktEbDJu?=
 =?utf-8?B?dm50aWZGbG5sYW5yWEZiOVZ6aEQwbXZnTVEwcXc0TFA4d1RNd3czVVZmTEx5?=
 =?utf-8?B?ZURpcll2TUlBMFJ6cE1YV2xwZ3NrK2k2VzFjWFJQS25zSkJFNzZIZUpkS3pv?=
 =?utf-8?B?ZExnRDdya0ViOUhEeUlJQ0JHQUNFUDRXL2tmMTd3SjNqNlM2YWNqeTVYWGts?=
 =?utf-8?B?Q0RrWi9vMzgzR3pCQkl2dGs1U0w1RXdMdjQ1dXd0ME5BVEsreDVyU3YvTkZi?=
 =?utf-8?B?OHkwdXUrYkJ5bEplZ3NZUW5TaGZDWVdYMTIrZGlWSGl6dUlicHVHWjdWTjZC?=
 =?utf-8?B?d3VlNlY0NElRaXlBTWhOZ3JiQ1dyRXBqNzl2NjYvc0lubzdRYmRSMGtWUVRR?=
 =?utf-8?B?UWwvSWpwZ0txOHlvMU02MS9VYVgyT1Q5N2Q4cm03dWd6cVFZZC9LbTlMMEo0?=
 =?utf-8?B?WWJUU1hteWkrU2oxYjFUcm51bXNic2EzbmlkVUJJcmQxY2hMZkNYejUxUUlH?=
 =?utf-8?B?T0pGd3pXKzRUSDFNRlBUd3BCclVTSUIvbVFoQWxhZ0V0S3BzQWNid0JhYkhp?=
 =?utf-8?B?RFpId2RNcmtwTVpJb0V1ZVdJQVhzeDlCK3hJVUphODg3OTJ5YnM3WUllN1U5?=
 =?utf-8?B?aVl1dnp0OGxQQ1gyQm1BMjJETk9sSFBFejMrb3NDTkR6NjBLOXZYMGxGbGg4?=
 =?utf-8?B?UlA2OTYwQzR5Z01CU3dQU0ZTRy9GeFlzdmU2dHVjZFJ4aWtNSjlGbWpybndT?=
 =?utf-8?B?bEM3dEtrUUM5K1lMT09LZ1UyNGVjb3ZPWm4yQ0s0ZU9aOFpSaE1iZjJqMHMw?=
 =?utf-8?B?Mmh3NkJuS2lhaXJQR0RZeDU2MlJTWXNvMFRMM0lNNlN4bU1RcUZySTQwTTQ0?=
 =?utf-8?B?cmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf70ca14-c742-4bec-faa7-08ddef5342d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 03:45:03.9003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z6HuMxJGmCgkPHt7egG8uuaUsRj4TjjuCMJK3orroqa5M7sC/a3k9XvsfOnplfOgxq72PlunfDWRvYWFS4xLSoYgBqbQj+y+EfGd50+hTiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2799

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogU2F0
dXJkYXksIEF1Z3VzdCAzMCwgMjAyNSAzOjE2IEFNDQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nv
bi5sZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBodmVya3VpbC1j
aXNjb0B4czRhbGwubmw7IGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20NCj4gQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGFmbGV5
LmtpbQ0KPiA8bGFmbGV5LmtpbUBjaGlwc25tZWRpYS5jb20+OyBiLWJybmljaEB0aS5jb207IGh2
ZXJrdWlsQHhzNGFsbC5ubDsgTmFzDQo+IENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvNF0gbWVkaWE6IGNoaXBzLW1lZGlhOiB3YXZl
NTogQWRkIFdBUk5fT04gdG8NCj4gY2hlY2sgaWYgZGVjX291dHB1dF9pbmZvIGlzIE5VTEwNCj4g
DQo+IExlIGx1bmRpIDIzIGp1aW4gMjAyNSDDoCAwOToyMSArMDkwMCwgSmFja3Nvbi5sZWUgYSDD
qWNyaXTCoDoNCj4gPiBGcm9tOiBKYWNrc29uIExlZSA8amFja3Nvbi5sZWVAY2hpcHNubWVkaWEu
Y29tPg0KPiA+DQo+ID4gVGhlIGRlY19vdXRwdXRfaW5mbyBjb3VsZCBiZSBhIG51bGwgcG9pbnRl
ciwgc28gV0FSTl9PTiBhcm91bmQgaXQgd2FzDQo+ID4gYWRkZWQuDQo+IA0KPiBJIHRoaW5rIHRv
IHdhcnJhbnQgYSBXQVJOX09OLCBpdHMgc2hvdWxkIGJlIHRoYXQgdGhlIGluZm8gc2hvdWxkIE5P
VCBiZQ0KPiBudWxsLg0KPiBXQVJOX09OIHNob3VsZCBiZSB1c2VkIGZvciBkcml2ZXIgcHJvZ3Jh
bW1pbmcgaXNzdWVzLiBJZiB0aGlzIGlzIHdoYXQgeW91DQo+IG1lYW4sIEkgd291bGQgcmV3b3Jk
Og0KPiANCj4gDQo+ICAgIFRoZSBkZWNfb3V0cHV0X2luZm8gc2hvdWxkIG5vdCBiZSBhIG51bGwg
cG9pbnRlciwgV0FSTl9PTiBhcm91bmQgaXQgdG8NCj4gICAgaW5kaWNhdGVzIGEgZHJpdmVyIGlz
c3VlLg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuDQoNCkphY2tzb24uDQoNCj4gDQo+
IGNoZWVycywNCj4gTmljb2xhcw0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2tzb24g
TGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogTmFz
IENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGkuYyB8IDIgKy0N
Cj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2
ZTUvd2F2ZTUtdnB1YXBpLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVk
aWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmMNCj4gPiBpbmRleCBlOTRkNmViYzlmODEuLjViMTBmOWY0
OWI5ZiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlh
L3dhdmU1L3dhdmU1LXZwdWFwaS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9j
aGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGkuYw0KPiA+IEBAIC00ODUsNyArNDg1LDcgQEAg
aW50IHdhdmU1X3ZwdV9kZWNfZ2V0X291dHB1dF9pbmZvKHN0cnVjdA0KPiB2cHVfaW5zdGFuY2Ug
Kmluc3QsIHN0cnVjdCBkZWNfb3V0cHV0X2kNCj4gPiDCoAlzdHJ1Y3QgdnB1X2RldmljZSAqdnB1
X2RldiA9IGluc3QtPmRldjsNCj4gPiDCoAlzdHJ1Y3QgZGVjX291dHB1dF9pbmZvICpkaXNwX2lu
Zm87DQo+ID4NCj4gPiAtCWlmICghaW5mbykNCj4gPiArCWlmIChXQVJOX09OKCFpbmZvKSkNCj4g
PiDCoAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiDCoAlwX2RlY19pbmZvID0gJmluc3QtPmNv
ZGVjX2luZm8tPmRlY19pbmZvOw0K

