Return-Path: <linux-media+bounces-16597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7795B0D1
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 10:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 893791C22915
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2024 08:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61B117C235;
	Thu, 22 Aug 2024 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="AGJgfKxk"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2065.outbound.protection.outlook.com [40.107.255.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD516EB76;
	Thu, 22 Aug 2024 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316291; cv=fail; b=siNVwnczS545BMd6SkaDRAM3kNOfMZvW76SwSf3AzB6GBlnbhS/zyR9DPct3Cr2lRKafpo63dgmVReXC0GrURY1Uy8rmWkuT8w7/R75toeTDaSDP2NfyE65ixVz5+T7umXwQnnoUMn4wSrThjCpGJUpZqpOBXU1Ib3oRWuhZPto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316291; c=relaxed/simple;
	bh=uU+Jqdf/3/DHtfwUJSCwMfbQ2edyjuxtIqmJxPx23aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jASMlpdJQ775tsSGRt7HtXB2hr4fVRdxpIDUyN0iTyr4UG/SAo+GfClQ6DPUqiq6fv3kVGDJKAbThQNefxjc52snQS2mWPPQCDGkpQqaSAyOiKYu58UDabraVTOuqb0d/hP9dcB49sGp6q2xUQORowUm53rubDEuhsKnCN8t/R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=AGJgfKxk; arc=fail smtp.client-ip=40.107.255.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzmkWLz5b5jVZ81HPPvS9B94sXamN4WVaBEoOi5LrsSpmdUSeY8ZDg35+wRDtWUDpTymJWt+CYAX8kjrbbhf5zcfdmnMOsfeP7mHXMtCQsikC3KRUqZomP9u5C27R5baRyZ97Y87xsKzKXdtjWj978gDNzQnyjRTshWNJh0hXUlwk0jzMT37bJydDhFQORA/0eYPA/DSifKIEYQF7qzkYUEaoDzUp4UvFiZ4+v59VLGl2yWAX+Mr2c/PNY3aa3fKVlzZOMPnFJ6gHIPJpgKQL1ZBH1hGYVBhDoVfZWbvP5aPAIEdGJXu2grDLyy9tT7hyH583AQCwO/8qYks1w62Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBoWxiC0767j5ureUaV1O4bR94sWbe0OopEd4xp5fjk=;
 b=x3aBYm5/xAZj/sDkuN3olgycFaEHNrRlXKFsXKTIc85tJsbGOk7pSYL4uYPbVO0aaCI6s4wn7xxAPOiH5aIqoVoZYsy/vJuEIrqy5A7rZXGcFeIw2GSqYZ2Z1aTLAcQOsnI+JoHfeU2Q+ZwAy2AaFgSz8CR9/pR6PftWUeS90xtBXEweyaHiyktNowOzRRVBmuqZHbxdNDTROTCvf1/Q9FKkBBwPaHF8GGkO8/vBy6xE2ou2tssvkD5xOYRnNcpX+EZqMfy4y1NOu613/RZjgY8O8IbrkPTTFE6e0hYZ683p0vi+30YbhFWAK+itpq8dWrt5dL2xdaE/6ZwPgdRPCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBoWxiC0767j5ureUaV1O4bR94sWbe0OopEd4xp5fjk=;
 b=AGJgfKxk/vqN8lxyzoRBgZCAV5143FiDdgz7xAKqzRrF8ooRy6PDslRsn57EDn5+VtRycWWRz/t/i1xmyhjMt9glmqzYzTBMeblJu2/R1xOHx6NKHu/SuROs/wkeiuwDKwxYWnYTebGR/0UeXAm+KTbk3p++N1s0HFWhcwlOiIL0DBZ+q8TnttBzKubZgs10CHbUVWA/TFR2dov4ROvKOZD4flwz7CifvzxgZxqzoBWmdl0rYp5IgHJo8cjgZ0dH93u11gGxvwG9p2bnRgBud4FkoK5ibMhsMLaBEJXnSLENETvwgtAJedL7YK+LFk3Ilg/bU6t6p4DaUa4yW0dPZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by TYZPR06MB6402.apcprd06.prod.outlook.com (2603:1096:400:425::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.27; Thu, 22 Aug
 2024 08:44:44 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 08:44:44 +0000
From: Huan Yang <link@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v4 2/5] udmabuf: change folios array from kmalloc to kvmalloc
Date: Thu, 22 Aug 2024 16:43:34 +0800
Message-ID: <20240822084342.1574914-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822084342.1574914-1-link@vivo.com>
References: <20240822084342.1574914-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|TYZPR06MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d36d840-a83e-4f37-332a-08dcc286abb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFp3amZWQmkyby9oUmg3bVpLNEliRDNPbXV6ajJiY3I0RkUyRG4vUC9COUZJ?=
 =?utf-8?B?NHJjQW9TZzA0OFRodzFnc2ZkOUlzRGJwOWFxNnF5OFJjaFRhczNlVko3a1p4?=
 =?utf-8?B?TDFENkNmY3MwWWZYSkxwYWhXdGRvUlhhUSt0eGJya2x4L2lzMTNCNkQ1NS9y?=
 =?utf-8?B?YjJEeFR2TlRCV0hsaVVwenpKQ0p2OEtwWVBSaHFPaWdzSitRWkdvejJoaDFC?=
 =?utf-8?B?bVZ2U3pBQ0VZN0NpMVNmZ1Y2eVhUcGk2NjFRbWFpaDBXUllYOE1MMVNpTzhW?=
 =?utf-8?B?L21qZTRKSU1UYnpBTGRmVDRLbFBCM1JFMUU0bWMwUHdmSWMzTTZrbW9kRm9q?=
 =?utf-8?B?Z2VEMDZEbjFKc1kxSnN2WDJjTGRmRDNLK215ZEozR3J5cEhIZmFudUtxUU5t?=
 =?utf-8?B?RXFJeXFLT091ZkN4QnkzTnNROW0yWlZJRUtjT3FRK2ozU2RsUUFKeWVzMHJ5?=
 =?utf-8?B?dFVzcWNTYUtZbkdNcEpGYUZGc2xMcEs2bGYrais1Y1JpTU9sWEsvZjdFK1NK?=
 =?utf-8?B?eTFtR0drZTN6ejZWay9SYm1yck1oZHNZZHJkaGU4MWI1VG45RVR6cytxbEpE?=
 =?utf-8?B?TkJtQU9OdUFNUTdJRGkyOHZUekdRMkRuY2RYZWFGLy8zWlRZYXRiTDVTcEF2?=
 =?utf-8?B?c3dUS0JKcnhwOHlzQnkzSG5MMlRCTmJWSHBwdHhyWmNudWNQaXFOREpQaGNL?=
 =?utf-8?B?QUpjT00zSXU5cUs4cXN2VW9HM1VuNGFFd0l3Yi9DbTFBd1BIWm5mY1hwYk5y?=
 =?utf-8?B?SGxBYkZFLzJ6aTRVOFR1VlpLVUZJbUkrZUdFeExtQTUxSzNCMGx5ZHBRZWxo?=
 =?utf-8?B?WjMyWWVicTBCd2F4ZjBWaFJwUVplUnh5UFF2Z3BxcThHZUlIYm4zSUpmeDg5?=
 =?utf-8?B?dFU2VzZtOUdISUZPaVJPaUkwS3N4L1Nvb1c5UXNpL3Z2RzA1bkt4cjA1Qndj?=
 =?utf-8?B?WnpVK1FNK0lJZE51R2ZQeDJHdmJhRENsc09URTh4U3BxRzhPbFpZV1NGQ3NH?=
 =?utf-8?B?YUlCaEZBRG1acTR2a3NVVDB4c3hFNUljWFRIU29nci9GSXpBc0psSmx2Q1lp?=
 =?utf-8?B?alFzUUJnbEowbGtmRGpab2dNOUpxWG0wcGxqS1U3WnlHUXkwbGcrSnZHeDYw?=
 =?utf-8?B?Z3BRNG9tL0Ewa2x6c3NES2JIdkw0aFZTTlNaQTVaV0E3dGJOdDRleU9YUHFh?=
 =?utf-8?B?S3dXU0pFb1NvQkNtSzM1V0FneGVsK3lEVjlKWnJ3bCtJVEdUVmErYnZsaUNl?=
 =?utf-8?B?ZUh3L3c1bW1jRHJkNDhwV1VrTWwxZHUxc0dWbzNXVHZyeGRkS3dlYnA2M3NO?=
 =?utf-8?B?WlNLS1lzckdMWUk3MXg2NU1sblVrTFdSRnZaTEtBd1NhWFg4d2gvRktZS3FL?=
 =?utf-8?B?allvZFdDei9RT2hpc1hFMFRHVWtHdUZxTXFrdnplRXFGdnJCSHc3VlVJbjVE?=
 =?utf-8?B?WkptR0ttT0VsNzhqQWVSWWRIeDl4dElKV1I4d3A3cHVIdEJtNkcyN1YzZkor?=
 =?utf-8?B?emRrZWdyZnNqOVFyb3kydmpLQS9QSWxBQ2YrS3l1VEova0RKTnhNVDNybXdL?=
 =?utf-8?B?czFIRDcweFNidXNlUEgydEVmK0FDc0tSdVc3bUVnM0VWUkltK2RFT1o3T0Fw?=
 =?utf-8?B?ZmdJTCtmME5kUjhFQmtoejROUFdSMFRQVitMTkovV1ZHVlc4Wjk5RGRYM2h5?=
 =?utf-8?B?anIyeEtZNDJvOWZCdVR6Y0ZIdHl0ZHd1Vk1XY3pwWlNGNHI5cmtTNEFXVGU1?=
 =?utf-8?B?SEptSG9rS1Mrbkk5aTlGa3NRU0c3enFHd3BCVElldVhLWXVrbHFNQThVN0E4?=
 =?utf-8?B?U1IwQ1BVaUoyelA3YXFBd3FDd2VyQjdQRzUxYWlDdXpLc203QXZySmhRTFBX?=
 =?utf-8?B?WEovbXhuZjZRdmpUcUFmL0xIWWhHYWl1amxsaHhjQ1BhTEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0R4Y1lCZ0RVbk5OS3YxeVVtLzR0WGxoblY0Sk9HbGEvd1hKMDFvdHpWMDNo?=
 =?utf-8?B?TEpOendhSkJFV0tUVitwSXlSUURhYXVneTZXa0xMdTRsOTlMczFWTTJWRWVJ?=
 =?utf-8?B?dEVwcmRJQXJrcS9KNE9zU2EvWjdkZEc2U2k3bENVUHpOcVZyOWhNWXg0Mlhv?=
 =?utf-8?B?YXd2TG0zSDROTEkrUGc3OWYvaEZUTEphdmxwOGU5RVQrbW42Mk5CN1ZCdURK?=
 =?utf-8?B?bWtiK09SMGdLUWlLVk1raERpeUdIY092TUVkZ1pqR05HRW9tblc0bFJQRGpD?=
 =?utf-8?B?YVhLNXh0YWVtVERwdWlWRjBlbkVhWTNHby9xc0hXZjRzTWpGcmNTTFF0V1dp?=
 =?utf-8?B?SE9RVGk2Y2htYUJKNm00enVYck83djA2eUVUUDcvVndvNXVIeVo0VlZBSnhu?=
 =?utf-8?B?OVBYOTFWejB4cmJQRGU5ZkJnMnpKRjJzMFpSMlI1WVFaRHcvUzVzK2RhdkdM?=
 =?utf-8?B?R1N1VWZCT3QxRDAvYXFsUDhNVVQ5VTZpbDdzR0YwNzZSaE5lSXNlNHRQRkhH?=
 =?utf-8?B?TnRiUTh0Y0VxRkMrMFgvVmcySUc4b2g5S0cxK1hyVk1US0pFcnd6MUpaMkRK?=
 =?utf-8?B?eHdQemE5ZVVOblhORDlIdThvbmt6aHVRWnR0dkkzdUdDSElrYng2dHk1UlY5?=
 =?utf-8?B?M1cyMmdSQ0E1UTN4aUt1SnIzczhpUGdoNnY5S29SOTN4c1RQUWhHZDhwaWVn?=
 =?utf-8?B?cVIwV28yMU1ncVN5Y0l1VEE3UW16ZmRNU2NJRVVFVGtNS1h0VW9QN0NMNERz?=
 =?utf-8?B?SlBiMFowRW4yNWdDUkFuZjNYMDM0K3pocXN5Vm1HSTNuZGd2WDZWdHJ1dFJs?=
 =?utf-8?B?eGd4dDAzU0lyOHRod1JMTjZSMVdyS1FUTjdRR3JaMUt3M2lwZkdRdjY0cEFy?=
 =?utf-8?B?azFRd1dudWpRT2k5ZVBHQTNMM1R6aDN3cm5Od2wybHgzdzF3ZDVoendLYTZX?=
 =?utf-8?B?VXF0bWZEeDFLdDV1OGM3bGRveUs1U0FUd3pzY0FhTU5kVXNEMnY3ZTVRcFNT?=
 =?utf-8?B?VjN4SDFianN3Z0tNQm52TFpaekpyZmhyYUdPVExNYUVRUXNERzhmajd0TFlx?=
 =?utf-8?B?aFhlbEhaMGtVNE0zWHczTTMyVTB5cCtZaTZmbTFQbTFUZlV1R0MwT1dQZStk?=
 =?utf-8?B?VFh4YUl4ZFZSbGw1SGQ1cmpkRlAxakpvamVkNEVvakNCM295c0VDOUY5MDZk?=
 =?utf-8?B?RHFVNVZReUN6VWNsYnlXTFE5NVo1anZiREkxNGk4U0l5Q1hFUmRTcDNMQjZt?=
 =?utf-8?B?OVNXdThDUGtSWWJTU2ZXVlNydDRZdUhFU3FzeHJMeUpybzRCdmVSVy9nUGo1?=
 =?utf-8?B?RktaOGM2d0JoUU5hUEpQbVNFOGZ5MmlqRVhiNFFvTzVLaFhRQWR1UkFMWFA3?=
 =?utf-8?B?K1ZsbzRta1lmZEw0aGxJakdkeEtrM0M2Y3NpYUxYWXN5ZnljWEExS3pyaTRT?=
 =?utf-8?B?b3B5RXh1eHlZbUlxd01GeVg5VFZ4WEZlQ3pzRGRJb01zR0RrUXh2dkFZZTZu?=
 =?utf-8?B?cERQVW1HU0hBajBhNm5ySUhteStxd2lFaFYybC9rSzdBS3I3RFVzT2IwdCt4?=
 =?utf-8?B?bGxmSFlpQ2NrcjZTdXJadGZuTTF4dkpzR2xtbkhPaU9iYzkrQVBUQTlYcEFD?=
 =?utf-8?B?TzdUYkt0MWtvWW9qbUtXdEQ3bk14ME01aytiL3BqWitVTjlyTTlQU1k0NkhH?=
 =?utf-8?B?eHFZNXpNWHE3cG5ZSXQ4U3dscHpjK3BJUlNMaHVBK3dxVzdvK05raWxhTkRY?=
 =?utf-8?B?SWJZZHdaejhsWjMxUWxrc3lSRW1lV2JTd0NpS1J5bDcxOVQ1SlVtWlltWU1m?=
 =?utf-8?B?K0doQmNpVDhJaGVuTkxVZklMdk0vc05SZ01RVXVSV2tZS3hOSHo1eVNZaHI5?=
 =?utf-8?B?ZWViSk1URVU1V3FucDl3M3BnYzVpbkVQN2w0TGVTVHJWQ2ZVU2RQUnArRk9U?=
 =?utf-8?B?a0tRbjgyY2M3Y1dGcUJDZjNCZFp4UXA2U0VXOWtNaS8vd2dpTllGWWFjUWZQ?=
 =?utf-8?B?ajl1clY0U2x6K1RtL0N4MnFQbFdkUWZOSW1YeTVVK1RoN2RyZlR5TUt4alhJ?=
 =?utf-8?B?cFVSSCtReTh1TFZqN2g2VEE5RVdHME9Eek5GMWZINHJZYUxsOUJFaUZFRmhH?=
 =?utf-8?Q?a3BigWzEhuyUKgWyn908t4Cfh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d36d840-a83e-4f37-332a-08dcc286abb0
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:44:44.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCFDaTiiydVsCrklW2IykbodBFt4GLWfU90igbjW5HfU5GE+IQmeJtg9rQMf5O8af4Q2lfrcdrBVT2/pLNWM2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6402

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 0e33d25310ec..1bad4576d492 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -102,7 +102,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -110,7 +110,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -218,8 +218,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -344,14 +344,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				 GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -365,7 +365,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -375,7 +375,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -404,7 +404,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -420,8 +420,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2


