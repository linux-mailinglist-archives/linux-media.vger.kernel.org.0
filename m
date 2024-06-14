Return-Path: <linux-media+bounces-13269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C2908C3E
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 15:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4518F285FB4
	for <lists+linux-media@lfdr.de>; Fri, 14 Jun 2024 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1919A19A29E;
	Fri, 14 Jun 2024 13:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qJzsea17"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB741836E6
	for <linux-media@vger.kernel.org>; Fri, 14 Jun 2024 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718370448; cv=fail; b=BS1VNZ07/pF5uocX0zjaJxzBP0vjaYxu9ZdbFdYB0IDnW4U5bYNBWEZDJKtg2EL7mDo69WWJh997Z3yBDoaSh1c+DkW6D3SvUvdEr99o5tKq3KpEjzdGLAxlOJuRabv4B0X2F0YsS6pVzNnzfbWCwtYI6/xWEYDuz1fZwGuK3+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718370448; c=relaxed/simple;
	bh=svynCQiBn3nnFCRdbTqaFJ8wI5ubl6XjAJpttv1e03Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nuO6ag34l5ysTl9UG14HDphCwGuV9qePh/+cTH/H5sT3BeMTWWHTazFgXn88VVVlSDwKWKOZOW8nNwi0DV7BrutGwQosaFRYd4uefNN6NLc4i888zCzNT3VwqDAU0zq6FAg1vMidRb5kiEkke7LlE/HhRv8a73B4b5yExrC7WM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qJzsea17; arc=fail smtp.client-ip=40.107.220.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/pNOdLIlhpto34QjtZqrkpFMdcIWa+W1HJvg424UgDhV6ag0lMeHAlJw9P+/7Kf3Q43hrYmHMgm05LXDaUNik01pzAmEtWDhpu0SgUfW9Kn4ri372zOHyX7Hdc1Dql7z0RdBJV+06GMe2g7HdZIhm4OyD/UJsKKbHXHMKQpDaEiyOu+3wdmd5lUrTMZIGAIdqvj5vWDwkASpG5dpKIn9BqjgLEuh0bGbz0GQ2XubWBGtpB095gZp5C2NASyYvdd092uqJXTNt7K2kb6Vxxe4yLJwxDhdk/jYHbLwAz67X26yy7EDuWFRlb+de54Zv2uZVNACQ1O6piVLSory+9F4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svynCQiBn3nnFCRdbTqaFJ8wI5ubl6XjAJpttv1e03Y=;
 b=ArSmKNjFWZny74zl1lWoUX1Bmf4ohg0OQjVW1kcWo2b3bau5Vb+WVegQdwy1TOqqbqftUxMeiMtFkJrrFatgA3gevdn513b7WV0PpvO6jswKk3jMPLdxtXugnnSLR70LK3I/4K9TvbOBWhF4gTo1VHVqY6t5rUXp99Vi4K8eDdknIIlXLvKsREFUyahGDmnRKySvBIgH5KLsrciRKJaddVWnljQqLM5JUc9832aB5fJGJYsAxXXiXD2o/+HHdcudOT6zDs2gzzu0GFYUf71PJQjOtuZ2VdaQbGMyeOTNf0VywIw9d9/Ir3rEiyfFSf1HSnx0YshXjIWJ2MAYWazxBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svynCQiBn3nnFCRdbTqaFJ8wI5ubl6XjAJpttv1e03Y=;
 b=qJzsea17ss/OHCaTGup0KQpouBw5pIvlh6/1iV4DT+05CvFzU5C1DrXQthvg9gR9Uv55gaN4P+saeiqVkxSKiTNQzNcO0dreckPyNbwKo9iPnEqcYj2E2c2I9tpHgqEtQgbfPCPOPGA0coMNME846Q1JOT9KjFxJjRrXSCKcflE=
Received: from BY5PR12MB4950.namprd12.prod.outlook.com (2603:10b6:a03:1d9::11)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 13:07:24 +0000
Received: from BY5PR12MB4950.namprd12.prod.outlook.com
 ([fe80::c866:1f7f:8176:9ea9]) by BY5PR12MB4950.namprd12.prod.outlook.com
 ([fe80::c866:1f7f:8176:9ea9%2]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 13:07:24 +0000
From: "Gandhi, Neel" <neel.gandhi@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "sakari.ailus@iki.fi"
	<sakari.ailus@iki.fi>, "Hatle, Mark" <mark.hatle@amd.com>, "Allagadapa,
 Varunkumar" <varunkumar.allagadapa@amd.com>, "Sagar, Vishal"
	<vishal.sagar@amd.com>
Subject: RE: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
Thread-Topic: [v4l-utils] utils: media-ctl: Install media-ctl header and
 library files
Thread-Index: AQHavidgvlu6MGvcsU25HP8Lj11sjLHHCEGAgAAykjA=
Date: Fri, 14 Jun 2024 13:07:24 +0000
Message-ID:
 <BY5PR12MB4950321E05846F4A64793C25FCC22@BY5PR12MB4950.namprd12.prod.outlook.com>
References: <20240614065120.896247-1-neel.gandhi@amd.com>
 <20240614100445.GD6806@pendragon.ideasonboard.com>
In-Reply-To: <20240614100445.GD6806@pendragon.ideasonboard.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4950:EE_|PH0PR12MB7888:EE_
x-ms-office365-filtering-correlation-id: 40368c7d-96b0-42d7-04b0-08dc8c72eefb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUp4bjZRMCtxVVB6WVk5Ykdlbm0zVXhWTU51eFpQd1VXMU5XSzV2NlJQZllh?=
 =?utf-8?B?RzN1UmRLNXEyQ3o1YUVMZFhhVTdrNEl5dWU1WjhoMDh4aytyWjdMbWFVYTZ4?=
 =?utf-8?B?RnptNURnb1pQY2J1VlhVelZSdVcxMEszZVIyUEMwYjlOZlFuYytqNmFkc3I0?=
 =?utf-8?B?NzBzUVJ3eHhLenpLUGo2SGdwVFFRSWY4aEVIV3FYTlcxTERlc1JOZnpheUtH?=
 =?utf-8?B?SkNjdDdXVXE0d2dCNnVZNXNLektHMDYyb3gvN3U1UmFndmdFcE5XUldkamJz?=
 =?utf-8?B?TUk0MVRBcXdwalkxdStNY3pxZVl1aVZFaHhwQ1oyNitNSnZBVUNlWDRld3ZD?=
 =?utf-8?B?REVEOHpDRXUzU0x0UnBPTVE2V1ZTclBxclE5M2R2QmNPdi8rWmVLd2FaTzBM?=
 =?utf-8?B?d2o0Ymh4R1J0N3c5bm03ZWdlQU55dHhRQVcrUHd4TEx1OURLQXpSZXo0Uk9U?=
 =?utf-8?B?Z25ZL1hlWGdZMitUalVxb2EwcFBPQmo5RVpObnFGVkt1WGpTL0tKQmpOUENS?=
 =?utf-8?B?aWRqclRDc1NLWmp5ajFYODk5SXV1Ym1iVWVnZDJLOVdjNW1QdHUwR0xJbS9S?=
 =?utf-8?B?eFZHd0dhS0N2cUR6VzhVTG5yZ3JrMStraEdXS0xIK0VoK2NrMWQ5eEJ6Y3Bm?=
 =?utf-8?B?Q2ZtK2NWaFdzb3NmVU9tZjlPTzRTUzdSb0NPNGNZQVdmT0F1bTduNDAyaW9m?=
 =?utf-8?B?clFObHB4ZzUycFA2RldzKytzREZhYXlkZ0MwWmpGMWpWUFRFeTU3V05aVmVB?=
 =?utf-8?B?dzI2ejM5RFY0cGUwZzRzRUlWOHhJdkQrNXVpM0ZPMU9iTGxseVJDWWZEQzda?=
 =?utf-8?B?UlFqcCtnY1NHbzA0dEg3YjZ0RHQ1UWd6clJ3OXFGclZRNldPbFYxakw4ZDY4?=
 =?utf-8?B?cGZ4Vjdjb045QThVNlgrcXhmY0wrSTladEFqNEJYWDZCRDNRdHFycUN1dU9k?=
 =?utf-8?B?SlpwNi9nMW1IZUdXQzdSMjBvdkgxSTlGNnhnZ3EwamZ5VkhvTmlBMmYxTVVC?=
 =?utf-8?B?a3JYRlRPaU9xa2pDMXNKK29DalI0WE5pcmltSW54L3REZVcyNHNDQzQ5R1Vy?=
 =?utf-8?B?Znpqclg4Ujkyejh3UnZhczdLREpNSEtrKzVFKzZleURCZ1BvcC9rd21nWXU3?=
 =?utf-8?B?WWVlZU1QcmNodVpkVThQUWZsZThqZlNTVmpBYndFNXM3UkUwWEoydzkyRkhq?=
 =?utf-8?B?bEsvMjYxaERXaExrcmY1THArbEI0dFB0RWJ3NG8vZHFUM2JNTXRmUnBDSVdm?=
 =?utf-8?B?L01id2lpK0ZhcTJ1RlkrV0xobkxDWW80ZytmR25wQWI5ajVGZ3ZZTzhTWHla?=
 =?utf-8?B?bkZGUGtDeWtkNmFsVHA1aWZCUDZBck8xUDQvSEQ5U1RvbytmeHlhT3RBOENO?=
 =?utf-8?B?d0xGUFEwYzJiQWJPSzlqQmVyN3dkbmRpZjJnbzZmUTd2aGFEaGxnU2MxdGI4?=
 =?utf-8?B?RnMyMGpoaGRzekxIa2tZREdEWEl1QTNEYVBxM0psQ2FDNlduVDkwa05MVmZj?=
 =?utf-8?B?REpTaklKNlhBNDZtVTMxY2RPanpKRzFoQjdLZlBwTFNTUFpmZEhqbU1USWNk?=
 =?utf-8?B?dmdaa2ZvL3J6OHNudnV4eU5iaHpKZFVNQkMxSldzdDVYTC9ON3ltQm5halZS?=
 =?utf-8?B?eUpyb1FhOWlzYzhUUUxnZG0vdEN3cVRSWVA1dGxGbGswQ29rK3ZIdURRenJv?=
 =?utf-8?B?bEZOS0JwQjJIOEk0dDk5ckphTUdWQlFLQ3o3ZWNZUGRyd1pnOHNMbEVlUDcv?=
 =?utf-8?B?cS8relV1ZUVYUFdRNzhnQllrdnlaQkNVQkllbjBIVUVWRmwyZ1UxcWRsRTg3?=
 =?utf-8?Q?BI8mGbdZWI6Fo33F2Tg4ksyowSONWdJZz8pmY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4950.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmFaeWhOWUhtbnd0UllFdHEvM1BZYis5WmQyR2RrWUpKbGxxRTZsb3hGa1Zj?=
 =?utf-8?B?VmFQWmhDQm1mZmRySHVmNHd3akZabzhKa3RRdkhQODlaVmE4ZjdpQ1hhWlVD?=
 =?utf-8?B?blJLZmxrWEU5bWk2YW5pNXU3c0x4T3pFYnV0Szg3SG9tYWlyeDAyL1hocjZE?=
 =?utf-8?B?R09YdkhTZkkyTnlJa1R0TDVqNXpzRlRIMklvZTFnemdHeHZTcFU4Z3U5M0p0?=
 =?utf-8?B?K0t6blZhSGkreG5mRnZrVVY0cmtrVDBKaVBqQzFUZEFMckQxZWg3cG1xSGlk?=
 =?utf-8?B?VG9TRUU1dURvLy8vTUJ6THVRZTc3R09MRWh0bGY2UUJBSkpMNlZiS2VaNWpp?=
 =?utf-8?B?QmE3Y2M5RkhzTnE4UWR4RnFxY284b1NLd05SbVdMWjIybDZRS3BwZi96cHVS?=
 =?utf-8?B?ZklhTFBRYnlmbjBtT1RXNWRZb1pTd1NoV2o4MURHakZPOVJxbXJ1NFpaKzcz?=
 =?utf-8?B?T2tuRHpBb281SnlqUnp0dVZsQTBrMEJ4SzlhZHRET1N5VEVreHVMUTRoRk1o?=
 =?utf-8?B?TklyNmIvZHJCNDI4VjdjSEdLWFo2aThFUi82U0VsZkFJV1l5LzlYaDJjSUhC?=
 =?utf-8?B?L1RKSnRRZTZVWTc0eGlNNTR0d1lSK3JEeFZ1aWYvV2xRWkdLT0RmZlJKUDdp?=
 =?utf-8?B?djBRbk1pZEY5WGFJd1V3VFdPYTRvUHpJY0ZURGVDNmlBQXZidWtOclJZc1Nh?=
 =?utf-8?B?ZkNIUkJTSHVXVkJHUy9LVklrUjAxdHc5eU1jSTJMSEVuM21QU2hFd1N6SVI5?=
 =?utf-8?B?SkNkODdhSTlPQTNka3ZRd3BVUm83eE9Ccnp6ZnV2YXFTM0JqNTFGODhvdGNU?=
 =?utf-8?B?VzRsM0tMQzNKUGM5ZVhxR1lUVjltaVNOd2wrZVhwYmp5Ri9YdVEvYjI4ekJC?=
 =?utf-8?B?VHNaNGQ0aS9nRFAwY1hJT3hYZjR1OTh3eVpLdUJpemgxei83OG5Zd3dEV0l5?=
 =?utf-8?B?Wmx1VFZVQmk1SmhDWUtxd2lBTE5FSnI1VThsSm5MWTUxWXY4QSt4QWh6T3Qv?=
 =?utf-8?B?VTcvejBJaldkL0F3d1pmcFpUK1RiaFkzK2k0dWZDL0NnL3cydVVPVWRWekZJ?=
 =?utf-8?B?dWZKcDdkN3JBako0Umg3TmRER1JjcWFyTHlhVWpZUHRjUVBveW1md2ErVGwx?=
 =?utf-8?B?d1RaZUgwSWRXbjJYejFiVHppYUxINUhNQ2t2QWtMdDBwd2llS2p0eUd4ZmR6?=
 =?utf-8?B?K1VEbVR4RFFWWEhCeEV3UXp2ZHVBUEZzSXZqL1VjL1FPZ1ZveEFiTlVIN0FF?=
 =?utf-8?B?eEFoa1UrVmVyOXBkZTlGcy9tR2N0TnhhbTJrN3F5aTUzcmVzRElvRUovRUtx?=
 =?utf-8?B?dHRpc2ZUQVRGRjMyd1BhdWZ4UnR1UU1BYXFmbXBya2IzMWxtcWFZTHdMMmRL?=
 =?utf-8?B?Qmx6NFA3Q0RyL0V1WkhPWXVaa0tYMTlUeElRdnZEZGtURDdLV0dlYnVVemZ4?=
 =?utf-8?B?OTI2Sko2aGJ5YU9nanUxaXpFOFVqbVdVSldVc0c1TDBuKzlDU0VtcGdXTFRY?=
 =?utf-8?B?dnFSQnB4Q1RVd3krQytHNHJOR3VPSUVFVnFqY0prMlU0Ly9xdmpCZlVtbTZx?=
 =?utf-8?B?NmhDMzNiZEEvRzVYRTFuWXYzam9zamdRcnd5dmtzK3Z0Zm9DajVHZGpZbTVj?=
 =?utf-8?B?c0pzREVOZUxGTnpQL09BQXR6YlFsVnlWYmhrVWNEVHN1UWFzYnQxT3JoSmg4?=
 =?utf-8?B?SUdocGdGLzhrMFRRbFEwM0xUelNEY09wSHFFT01LZGlScGNQdmJNRjl3QUEz?=
 =?utf-8?B?alloQVdwSG5iTlpLY3VkeCtNNFN2M2pTYldyK2RsRXVxVXVWV29QaGZXZm5t?=
 =?utf-8?B?WlBNNFB5WjM1WW0xNUtzTDBqY2xlaHhmd0ZZYW05dlMvcFkrVEZhN09ldkps?=
 =?utf-8?B?OUdBbVdXSkwrRWJNWUU0U0p3ZXNNYmpLckE1eUlYcnE0dk84cGhWMGU1MGEz?=
 =?utf-8?B?L1RRQmpwbTk2K3FqSG5xK1NGTDltdTdsQ3RRdldVZHJzQytvazZHaW8wS2VQ?=
 =?utf-8?B?VnU2Y2hZUnNNdmtxZUtvOHFsOFBOM3dVbFh5dnhaOUJnTWx5UW5NWXBZUWV1?=
 =?utf-8?B?a25saUtDY3Y0NGQ1UmhacUgxUmdhUFppNm1ONk9JZnpjMWhYTnBwTHUxN0lG?=
 =?utf-8?Q?ZxXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4950.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40368c7d-96b0-42d7-04b0-08dc8c72eefb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 13:07:24.2780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d3FVeRCJBwexch6GZowMoN8o62ABRwI/zwZafpfphC9CTJxZ6e1uyKYYOxLBV5QJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHF1aWNrIHJlc3BvbnNlLiBQbGVhc2Ug
c2VlIG15IGJlbG93IGlubGluZSByZXNwb25zZS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAxNCwgMjAyNCAzOjM1IFBNDQo+IFRvOiBH
YW5kaGksIE5lZWwgPG5lZWwuZ2FuZGhpQGFtZC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IGh2ZXJrdWlsQHhzNGFsbC5ubDsgc2FrYXJpLmFpbHVzQGlraS5maTsgSGF0
bGUsDQo+IE1hcmsgPG1hcmsuaGF0bGVAYW1kLmNvbT47IEFsbGFnYWRhcGEsIFZhcnVua3VtYXIN
Cj4gPHZhcnVua3VtYXIuYWxsYWdhZGFwYUBhbWQuY29tPjsgU2FnYXIsIFZpc2hhbCA8dmlzaGFs
LnNhZ2FyQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbdjRsLXV0aWxzXSB1dGlsczogbWVkaWEt
Y3RsOiBJbnN0YWxsIG1lZGlhLWN0bCBoZWFkZXIgYW5kIGxpYnJhcnkgZmlsZXMNCj4gDQo+IEhp
IE5lZWwsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIEZyaSwgSnVu
IDE0LCAyMDI0IGF0IDEyOjIxOjIwUE0gKzA1MzAsIE5lZWwgR2FuZGhpIHdyb3RlOg0KPiA+IElu
c3RhbGwgbWVkaWFjdGwgYW5kIHY0bDJzdWJkZXYgaGVhZGVyIGFuZCBsaWJyYXJ5IGZpbGVzLCB3
aGljaCBtYXkgYmUNCj4gPiByZXF1aXJlZCBieSAzcmQgcGFydHkgYXBwbGljYXRpb25zIHRvIHBv
cHVsYXRlIGFuZCBjb250cm9sIHY0bDJzdWJkZXYNCj4gPiBkZXZpY2Ugbm9kZSB0cmVlDQo+IA0K
PiBXZSBoYXZlbid0IGRvbmUgc28gYmVjYXVzZSB0aGUgQVBJIG9mIHRob3NlIGxpYnJhcmllcyBp
cyBjdXJyZW50bHkgaW50ZXJuYWwsIGFuZA0KPiBub3QgZ3VhcmFudGVlZCB0byBiZSBzdGFibGUu
DQo+IA0KDQpTbywgaWYgb25lJ3MgYXBwbGljYXRpb24gaXMgZGV2ZWxvcGVkIGJhc2VkIG9uIHRo
b3NlIGxpYnJhcmllcywgdGhlbiBpcyB0aGVyZSBhbnkgYWx0ZXJuYXRpdmUgc29sdXRpb24gZm9y
IGl0Pw0KDQpBcyBpbiB0aGUgcHJpb3IgdmVyc2lvbnMgb2YgdjRsLXV0aWxzIHBhY2thZ2UsIHRo
b3NlIGxpYnJhcmllcyBhcmUgYXZhaWxhYmxlIHRvIHVzZSBidXQgaXQgd2FzIHJlbW92ZWQgZnJv
bSB2MS4yNSsgb253YXJkcyAoZnJvbSBtZXNvbiByZWxhdGVkIGNoYW5nZXMgaW4gYzJiOTFiOWMz
ODUzYjJjYmNiZTE3MGE1NDI4NjRhMzE0N2QxNzllZSBjb21taXRJRCkuIFdlJ3JlIHVzaW5nIHlv
Y3RvIHNjYXJ0aGdhcCwgd2hpY2ggaXMgdXNpbmcgdjEuMjYuDQoNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBOZWVsIEdhbmRoaSA8bmVlbC5nYW5kaGlAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgdXRpbHMv
bWVkaWEtY3RsL21lc29uLmJ1aWxkIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS91dGlscy9tZWRpYS1jdGwvbWVzb24uYnVpbGQgYi91dGlscy9t
ZWRpYS1jdGwvbWVzb24uYnVpbGQNCj4gPiBpbmRleCAzYTdiMGM5YS4uNDA2NjliNGMgMTAwNjQ0
DQo+ID4gLS0tIGEvdXRpbHMvbWVkaWEtY3RsL21lc29uLmJ1aWxkDQo+ID4gKysrIGIvdXRpbHMv
bWVkaWEtY3RsL21lc29uLmJ1aWxkDQo+ID4gQEAgLTMsMTQgKzMsMjQgQEAgbGlibWVkaWFjdGxf
c291cmNlcyA9IGZpbGVzKA0KPiA+ICAgICAgJ21lZGlhY3RsLXByaXYuaCcsDQo+ID4gICkNCj4g
Pg0KPiA+ICtsaWJtZWRpYWN0bF9hcGkgPSBmaWxlcygNCj4gPiArICAgICdtZWRpYWN0bC5oJywN
Cj4gPiArICAgICd2NGwyc3ViZGV2LmgnLA0KPiA+ICspDQo+ID4gKw0KPiA+ICtpbnN0YWxsX2hl
YWRlcnMobGlibWVkaWFjdGxfYXBpLCBzdWJkaXI6ICdtZWRpYWN0bCcpDQo+ID4gKw0KPiA+ICBs
aWJtZWRpYWN0bF9kZXBzID0gWw0KPiA+ICAgICAgZGVwX2xpYnVkZXYsDQo+ID4gIF0NCj4gPg0K
PiA+IC1saWJtZWRpYWN0bCA9IHN0YXRpY19saWJyYXJ5KCdtZWRpYWN0bCcsDQo+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbGlibWVkaWFjdGxfc291cmNlcywNCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXBlbmRlbmNpZXMgOiBsaWJtZWRpYWN0bF9kZXBzLA0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluY2x1ZGVfZGlyZWN0b3JpZXMgOiB2
NGwyX3V0aWxzX2luY2RpcikNCj4gPiArbGlibWVkaWFjdGwgPSBsaWJyYXJ5KCdtZWRpYWN0bCcs
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBsaWJtZWRpYWN0bF9zb3VyY2VzLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgc292ZXJzaW9uOiAnMCcsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICB2ZXJzaW9uOiAnMC4wLjAnLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgaW5z
dGFsbCA6IHRydWUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICBkZXBlbmRlbmNpZXMgOiBs
aWJtZWRpYWN0bF9kZXBzLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJl
Y3RvcmllcyA6IHY0bDJfdXRpbHNfaW5jZGlyKQ0KPiA+DQo+ID4gIGRlcF9saWJtZWRpYWN0bCA9
IGRlY2xhcmVfZGVwZW5kZW5jeShsaW5rX3dpdGggOiBsaWJtZWRpYWN0bCkNCj4gPg0KPiA+IEBA
IC0xOCw5ICsyOCwxMyBAQCBsaWJ2NGwyc3ViZGV2X3NvdXJjZXMgPSBmaWxlcygnbGlidjRsMnN1
YmRldi5jJykNCj4gPiBsaWJ2NGwyc3ViZGV2X3NvdXJjZXMgKz0gbWVkaWFfYnVzX2Zvcm1hdF9u
YW1lc19oDQo+ID4gbGlidjRsMnN1YmRldl9zb3VyY2VzICs9IG1lZGlhX2J1c19mb3JtYXRfY29k
ZXNfaA0KPiA+DQo+ID4gLWxpYnY0bDJzdWJkZXYgPSBzdGF0aWNfbGlicmFyeSgndjRsMnN1YmRl
dicsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ2NGwyc3ViZGV2X3Nv
dXJjZXMsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmNsdWRlX2RpcmVj
dG9yaWVzIDogdjRsMl91dGlsc19pbmNkaXIpDQo+ID4gK2xpYnY0bDJzdWJkZXYgPSBsaWJyYXJ5
KCd2NGwyc3ViZGV2JywNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgbGlidjRsMnN1YmRl
dl9zb3VyY2VzLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICBzb3ZlcnNpb246ICcwJywN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbjogJzAuMC4wJywNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgaW5zdGFsbCA6IHRydWUsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIGRlcGVuZGVuY2llcyA6IGRlcF9saWJtZWRpYWN0bCwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgaW5jbHVkZV9kaXJlY3RvcmllcyA6IHY0bDJfdXRpbHNfaW5jZGlyKQ0K
PiA+DQo+ID4gIGRlcF9saWJ2NGwyc3ViZGV2ID0gZGVjbGFyZV9kZXBlbmRlbmN5KGxpbmtfd2l0
aCA6IGxpYnY0bDJzdWJkZXYpDQo+ID4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVy
ZW50IFBpbmNoYXJ0DQoNClRoYW5rcyAmIFJlZ2FyZHMsDQoNCk5lZWwgR2FuZGhpDQo=

