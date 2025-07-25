Return-Path: <linux-media+bounces-38442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE48B11A73
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC51177DD4
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 09:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3F5255F2D;
	Fri, 25 Jul 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="o0UhVsSD"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856291465A5;
	Fri, 25 Jul 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434202; cv=fail; b=lGnXK2OD8YGs7IY0MnpR+rS2IAa6JjKSBprTSaen56mbxVVKFFW0Hoy8cN3q2LG9Boy7PaabpdAnAyihnOpTFLOKTZea3k9ge6RG3m4aEc/xpddnMokmPkJ8DPnp7MgZi3N4GDA8RScF0dIcSEppsyIFZDlIlJFBZwHzWLBPfnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434202; c=relaxed/simple;
	bh=7FVOc9TGP84T6SglP+kkAqtzYSNFPv81l9ujW6JGSMw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tRY8SSvV4xCL0AGEpyuVFhaz00ofSkMQOr7prNidFS313j43BsWsVmIGWeN5L7X7cxjFIFMqcMxU3r7tvaUhJ0qxBjElw5/IRS0WKqov1UgqgMaGKKAekDiNJqdp2OtMYNw0G6x/d7yXzCBtfua3Rz68dn3IftlWvM1328ch1Uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=o0UhVsSD; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU+z+IpGBQzgeM5i9NeGlulUnORlPyJSF4bp7ZuUotKK3lzk1EVB94AGmjLZ7h9BsE8Nqe7Y85DatVpsjyfKqqyn92ZioKBBjBu4N0KECPVIz3xMsMsn0ekD3Crn68jfbWnq6rBIoRLjV+L8WjNAKc0q23uu4YqLuxaUvasJgG8JQXaoZaodhrOGHD9HELOfLQu22P9KRaUK3auAMjkViw2Dv1cFoZSfKmuyiLsyZXT3NWcvmMmhqZYubcxuBdgfebd+UFA8B2FOx1FnrbW+uadm6sWSbsRYeVy7B/9wTDilmoq1HaWVbDsSF/a42ZUvoaEegYvpdpxH+ArAn9iD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg/WnC5GicsnSH43JXygJqW745rw8j60BF1iCVzZoZw=;
 b=OuyPhr/tFcSC3mmV+qcoZr4tl7lFeouxbX0TvQuFso7f3X58clKuxQTAytj1+MigkUNALNqAtwMO7/KeNPB6MnTKx7+M0a6ELs+jvRSQCeNJaioKxcw804TpEVnq4x3PerBuzpG6cL85+yJqJb8vOUDtMpRRgwDUKqiX+uJAUQHLhJ6RAOqMBtaa3JMsHfdcUU2noznhAe/cn72iQPYO787FeoUbEwsVmgrm2H3mSnNKO+T6cbEyvNu+foOmDe/G4JdRwRFQ0LC5Qq9+QAIA7VoIIeIFa8c17VwHIYJe14EkyXM0o6QRD9kfvMMa+jeB6WZzu+eD6Bd9OPwHmgfrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg/WnC5GicsnSH43JXygJqW745rw8j60BF1iCVzZoZw=;
 b=o0UhVsSDBe/HNAW8uL88zQ7kRHL50cPZ/4yq4INH/zOVwG0NX8hk+yAdy1Z9YgOyfPgM5nMhc3UBQSfHj9vXsAd2zJJcBwdsMphoPIGpN1WKV9VUmIGe5zPNjD+rDWikeuLpG9K+TH0Lnc5LOGXGf4WKtOowa6lHxg9tjTgUG94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by BN7PPF683A477A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 09:03:18 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 09:03:17 +0000
Message-ID: <820992ca-479a-40fe-82bd-8ca46cd2fb14@amd.com>
Date: Fri, 25 Jul 2025 17:03:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-6-Bin.Du@amd.com> <aILfe9qaR49KGkcW@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aILfe9qaR49KGkcW@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::16)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|BN7PPF683A477A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f6ca74-f28d-4ecf-29ac-08ddcb5a1824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2FqbVBwNy9TWmhMUXhRUDNnU1RQSGo5YWduaVZqb1JnQndZY2YvN0d5UG5x?=
 =?utf-8?B?eHhYZFJER0NlWmNEZWhhU0MraUpvNDk0ekF6RTl4ODF2amFTaEJaZ1Y2YkZZ?=
 =?utf-8?B?N09oNktHQno4bHZsaHBoWms5T0cyRnBiSEdKMUVrWU5saGpRRHhqTnBWTXJO?=
 =?utf-8?B?NXUzTmxvS3k0eVNLMGQrR2dYL2ZpSHlaSE1kdDR4Mk9RN2I1bzBVVXcxc2tN?=
 =?utf-8?B?TXRYUXV3cjVFSjg0ZnNVR1hxc1RlVFVlRWh1cDZiakdQVUxhcVQxUTdzdUwy?=
 =?utf-8?B?c0hNODMrU0NWYlRQK2ZDVGtqWmhMSGw0clVyakVxNjFwZTVJcWVYRkRsUlBy?=
 =?utf-8?B?bUVuVHdLdWN6NTdrWG56c3BtS21WWmx1WXh2Z1BtZUZiNjN3anFZeXk0RVM0?=
 =?utf-8?B?WWQwZGFYV0NrMUcrZG9LRGUzcmJVZEFwVDlsTXg3TVRPVmFOZC9QNUh6c1RT?=
 =?utf-8?B?dE9meVVxd09SMktTamhmb044Nm1pWkw0Smw3c3VzdWorRmd0SHRjRkVDeExQ?=
 =?utf-8?B?Q2M2YlkyelBCV0Z6YVNXTkZ4RFlRQzI0NlFOeTc2OXBwUjBGR0R5TnhiRGwr?=
 =?utf-8?B?TGRYZG1sendwVmExVmNkNnNZVWk4V1JNZzVoQ0NZQkJHZDhPMHZPWWhGU0M0?=
 =?utf-8?B?QUNnME9CSGRjZXpZTXBzQ3hiTUNiMG53T0cvNzJ3QXRoMVdaMG13aHpYR0pT?=
 =?utf-8?B?cXlqR3F3emhPRW5IQk9xdm5kMXV2SEh1UDRJTjdlMU56OWIyZk9sczFKTnFi?=
 =?utf-8?B?dVlGdXBkTkdSNGVxUnBycmRUc2w2aFp3M3Y4TzNLZUVVSVU0UXZkQlFtWXFx?=
 =?utf-8?B?Zm0xRWRleGhUSktpMi9FRDVNRnRLNkxyNFo4MTZmbHB3Unhqb1N4NGM5blFo?=
 =?utf-8?B?RFRoZWhFczErR21BSFBsZVJ0K0lUaGcwam5ZMVMzUWRUWVlvazIveDBhZWFk?=
 =?utf-8?B?VUJuNWs3Y3pkdUN5YkhiRnhrZ3VkVGNvRmFIWGVTVEZPaVlWMkNQYTVKaUMr?=
 =?utf-8?B?eldMa3RLeHRKRWpYSVBIamNhalhKV2NXZkFiWGFNbGVKZWVqemZJcDlIRTZk?=
 =?utf-8?B?UG5zSnlWbVpqQ21zRXR1VjJvZ1ZVSUp5WXFlRjRpK0xubjZ2YmdVS3EwaW5o?=
 =?utf-8?B?dXIya0llV2pEeEo2TE9OMytUZWgybXFXdmVYK21EYUlCeENLeU84ZHhjMWIz?=
 =?utf-8?B?NUxJUFRkSFVwMjlYajNDVzBNdGFJSUNDNnRvMXFiVmZabjhnd202Z3JndzhH?=
 =?utf-8?B?MlFZS0RTeGF1blA2Qjh0dEVIVVRaZU90aFNxbkdCc1Z4dXJXZTE4SHltckhW?=
 =?utf-8?B?NTZGU3A2U0RObkdHdStXUHBUOURTcHFOaXl2ZkFDQklLVTROaVBTaitLcUJK?=
 =?utf-8?B?b3dYTzJzMU5RUTNhRUJsRHRrbmdvVTcvSmo2OU9VUXBkSjUxdGlhVlhaNmxj?=
 =?utf-8?B?QVdDQW1BcStkbUU2STZ6c1A2YjhXOFJTZzYxQ3JCS29lemhWK2psUnJTNFl2?=
 =?utf-8?B?amdXK05EMzRvVU1Wd2Jndmh4aDFxYTBBQzFkTUFveDZLZnd1dmE2eWFaRjZh?=
 =?utf-8?B?YzZQNjlGV2cwSjMyZWpDdm5JWE53MERFT3ZwU1ozRk1FdEVUY1hQam52THVH?=
 =?utf-8?B?VDI5dUZ4allyYjRvUzlXT3BpSFkwT3BzcmtKTUlRUFZBcDU5TXhvM3VRVjFQ?=
 =?utf-8?B?ejhnbExiTUsyUUdydkMxQm55TVJQT1BON3JIUElFZlUvcnJSQTZzRzg1TmpI?=
 =?utf-8?B?Zm41dmIwL2RWRHd4ME4wanVlT25pVHRqdTNUVlpLMFlqUnJ0eFpkbGY4WGgz?=
 =?utf-8?B?aFJGTFIrako1SGFnbThTTjIzeUF4WVEyRmg0ZjlkYVJwd0JldDZmY2JLNjVr?=
 =?utf-8?B?aXI5WHZXckU5S3QraW9pS0ZyVFZTbWUxQzg2RjZ1UCt5b3FYZXo1N1Q2R3Rw?=
 =?utf-8?Q?/ZNHEwUOnCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlZbGd5NFR5WW96dDhvUERodW93RmlGbjcvMHY3cEdnaDAwOExudlQwRlpI?=
 =?utf-8?B?YmFmZ0VvZzhaL1FsUjAxbXRMRWVZcEtWMkJON0tiTmhsZmZaNWZKZTQ0Qjhz?=
 =?utf-8?B?dTJ1Y01tR0NteFIyYWdzWCt6Z2dkb1JmY0ZLR2VVcDN4TTM3K09FQ1dlV2lR?=
 =?utf-8?B?UW5QTVprbTVta2xlcVU3U000Z2U4ZXJXalhKSXdQalBIZnk0K25nTG4vT1cr?=
 =?utf-8?B?dlZCVDRSOE9lZXlJdFRqVUhkcGczbGluVHRJNTY1ZjRxNFR1VkM2cFdvdVRV?=
 =?utf-8?B?dUcwdmdpNUF2bE50eTJneC9aaDJZQXEyZG4vYUptekNFSjE4TkJJWG15c0R4?=
 =?utf-8?B?QXNQU1Q5Y09QTk9COUJDU2JMU1I0T0xLbFJHaWRzblg4MmFndzVIaVhKTVZ3?=
 =?utf-8?B?b2NadXhLa2pHSEM0TDE2eU5xVGRwa09DdFpuak1IZnZrNG93cFRVMVFTa0Vr?=
 =?utf-8?B?eFFVb3I3MFA3aXVVSHlveEZwOVo5RDRUZHA0WFZWT0k5eU5wVEdLSXZtQXc5?=
 =?utf-8?B?TVNLVXFHZGJQMXFONk92OGtaL2hZdEQ3RlBvajErSDFwa3BVaGEzYkNNWlVi?=
 =?utf-8?B?UkFuSlFxSHJSSU9vM29oL2hkZFVyZmlqTDJqWFg1VjFPWWxwaW5uMXk0RzIx?=
 =?utf-8?B?SGFCcmpKdm9TWC9INng4eXNIMWJheXo0eHROSFNWejBzdkI1NGs1VG5SK09W?=
 =?utf-8?B?Y3R2cUdISEIydjI2T1VmU2lDMWNiTEtHcThqdS9sSmtsR0xOdXU2cDBOSWdZ?=
 =?utf-8?B?cWQzVHBwcjdCYmxvY1NQcTN2d1AxQzhoSmlzcWdIbzFJbnJMYnV6N3h2QTV3?=
 =?utf-8?B?YXVzK01YekJHQU03SVA5cU9hM3ZlNlJxc1BXNTRiUjB2WTIzVU9SSGM3L2dt?=
 =?utf-8?B?K3YrdlJGWE5jUFJxL2ZsZ254NjhNcGZmV1RkUEVic2ZYdE81Rk1rZm5NMWVv?=
 =?utf-8?B?TU9UT1BSbG0wa3FaR3kxalpxZGJKeU5DRTJQVncwUUxVdUEwZUhZS0Jod1BP?=
 =?utf-8?B?SU4reGN0eXZjc3Q2NnZOcWhUanlqTkZWY08xQmFNUGl5MUYyODJWL2NGbS9h?=
 =?utf-8?B?UGpPbVozZDRXVDdXMjhjV2UwKzVwaE81aW9FZmNqeXdWUkh6UzZqai9zbURK?=
 =?utf-8?B?L2lqNWJYM0FHdVIzQTNBZ3Q4eXpFVHRHUzE1a2FVRXpjd3gvM2VIMWcrYWJl?=
 =?utf-8?B?Q1dhNUhGTHEwNG05d3R2cHJ3Yk1zVVNwL0NqbUFGNHB6MVlzQU56N1llK2k3?=
 =?utf-8?B?NUo2b0VnRVlqK0ZzUUl5c0owblphWC9zT0pjdHlxeVUyNVRxOWtKelNXWTJw?=
 =?utf-8?B?R1U4OFNod2FBSTlGdSs4K2t6OWpNQ0szQm5BbmYzaWN4SmZpNVZRdnAvQjZJ?=
 =?utf-8?B?TkVaN3RSdjY3VXJGUDc2TkxmcXRjYmpkajJGUFA2R3VRNCtOK2NIT1NxQldH?=
 =?utf-8?B?VGk4U3ZYNDk3TnBaMWtHL3hYTTQxU3BRZm1IMG12VC9qRm9mK1Zzb3lRN1Bv?=
 =?utf-8?B?QjZkL3F2d2diVW80OFJmejM3bGVBTGkyOTczdkJvbUkwSFJ1S1hmcGR0Z3Bu?=
 =?utf-8?B?Y2RhWGRkSEpWSG16V2xNcTM0eFlyZGptNjA4M1YrTjhJTlIycGk4aTVhbDg1?=
 =?utf-8?B?WnJqK1dUTEYrb09VRUxLZDFGQXJINHdDL3c4S2pYc1V6bVJJekR5N1NjdDBN?=
 =?utf-8?B?Vlp2cUpCZ3dBTmU4QWpPTGxGcklFQ1BIeVBJQzNWQW9DZGJGdlNmZS9VRldP?=
 =?utf-8?B?RlZNYzltRzlDM2N4U2pMdi9aQi90QktvdCs2WnFaYjhIREI1bjhRbTBSR3lP?=
 =?utf-8?B?RG5URVQrR2FqUVlVcmtkVVlXYllMc0t3MkhEMG81dFZkbTY1WThoQWZTWCtk?=
 =?utf-8?B?dkYxOGNoUElpL2R3Mld3NytWYVRWV1FGa05rTWwvQ3EzRFRzMUlZVWFrZGNY?=
 =?utf-8?B?M3RGMis4Qkh3ejFqVUJuVkxuYjdmaTZ6NU0zeU51MXMxeFgwK01UcFdmZ09z?=
 =?utf-8?B?L05YYzJmRFZBRjhDNW14SVQ2QnVtVFZ6dUNLMml4UmZvVC8xSkZQUXF0Y0lS?=
 =?utf-8?B?UlB5SzJ6a0FEZ1M3dGNPNkgweFlqaVRLeGt5RU1OejAySkhGMzU2cFhnR0w3?=
 =?utf-8?Q?wsTI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f6ca74-f28d-4ecf-29ac-08ddcb5a1824
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:03:17.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtCsHGPg5fPm22M9cBfAyTVo5BVoL7r6JSyl3ENwBB5xTjei8Uo6s0CRordJdj+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF683A477A9

Thanks Sultan, will fix it in the next patch

Regards,
Bin

On 7/25/2025 9:35 AM, Sultan Alsawaf wrote:
> On Wed, Jun 18, 2025 at 05:19:56PM +0800, Bin Du wrote:
>> +static int isp4_parse_fwnode_init_async_nf(struct isp4_device *isp_dev)
>> +{
>> +	struct isp4_subdev *isp_sdev = &isp_dev->isp_sdev;
>> +	struct device *dev = &isp_dev->pdev->dev;
>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY
>> +	};
>> +	struct fwnode_handle *remote_ep = NULL;
>> +	struct fwnode_handle *local_ep = NULL;
> 
> [snip]
> 
>> +err_fwnode:
>> +	if (remote_ep)
>> +		fwnode_handle_put(remote_ep);
>> +	if (local_ep)
>> +		fwnode_handle_put(remote_ep);
> 
> Copy/paste error: the second fwnode_handle_put() should put `local_ep`.
> 
>> +
>> +	return ret;
>> +}
> 
> Sultan


