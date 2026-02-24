Return-Path: <linux-media+bounces-53269-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mvOxIM5ZnWmlOgQAu9opvQ
	(envelope-from <linux-media+bounces-53269-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:57:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876B183569
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 08:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7ED9D303CE2A
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 07:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CEB364EBF;
	Tue, 24 Feb 2026 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s82V4e2O"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05893644D2
	for <linux-media@vger.kernel.org>; Tue, 24 Feb 2026 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919813; cv=fail; b=C2/t2lnoLrDECA4Hv+zOcFkqrPirwpAEkQEVKnv8yCah6tSuG1lx8KvYvWxY25hKsOH+bBSrPugqR+INckL2KXx5AZ18oeZ4YVxoeC2vytkFnpT2l59ydNhlGFH1WRt7Hmo5fCXPBrKLB3Dmc/R0ImfVJaJKKIKYvOKPc6xWqdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919813; c=relaxed/simple;
	bh=H4frIO5HfKdxGG3XjaKdMYVdOQ8RLQLvoOYjdDuxF1E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sa3zLk7+LE7ygR79hb/lv+p3atHo+kkm1Bb6Mc8v+a8/VPilOLBZn20tkbR99mYKqFvkLOO3ySki/n0KiIKz+IsuwhxbDSgl5773cLqjPT3R3ttIJgvF/M8232XmFqwb413mYJI0gzU8cp+JMz7X1m+Bp1vXlg22EmLzt38QcEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s82V4e2O; arc=fail smtp.client-ip=52.101.52.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfoUaOc4CV9dbTckplvbP5xESAvU9oZHaVfpK5iSMfeBlgB1a+g3uLuNCDfMm8gkX5RliEr05avZZYVZ4MOR/zJythKkrId2TomnfKUTYdBDIsKgg4UrWgTpbOmx3qZr2F1KrR4rkprzl2WZrlEihec1LzifUR2w/WI6ceYlRIl/3pBA6hMbYfWpuoFPkV3P03j+iNVw60wqmb/8J3bJtAASLQIiyDT/qDNyK1v7+GEoTnXDpz2qlH7VyEbQ5NlBfZFdIihoyybIQlrIwMrPIvaSIdk8DqQ6ezWnBl5uJUQUNQRY1XOvewsN4SQxVnrYxSIazefN24mnNI+wABw6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhzNXoNS++z/M/0VfPSRY3nCQif7iY5B85HJY/USnXw=;
 b=YaP/THoC7rveRddvCEU0GSRdUxbCV9PubhsRUaZWKRShBjNVqyg1YG4Xj4tEv39cirHd7ifdDURuepcbQAmZ4fAtJ92OXn88uh1mDLD1Z9fO8Bsx4K+i01pj5Et9N6di9+/iqkMJAbo7YQMwX/wPMZgmaoEOut0ZX+Xyp4J9hcoiZHyVm/c9P3iod3UdJe8UwwRnia2H7QYXMD3twa2680ov4yG7PcnrmiBPP5v9wLBMPKl1PBdEs+u4JqHdlzMBwdfFDtfak1Vt2CAPK8rjZKkok3MnIBfrTRiVqGP5n1BGioN2xEk8mXUIpND8USYfUZ2cc0uIeBC7tCwSRWVT3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhzNXoNS++z/M/0VfPSRY3nCQif7iY5B85HJY/USnXw=;
 b=s82V4e2Ornos23yAISaV1i6KHii8B6p2UG11Jn564omYKbWMxQ337YcEAIToIBEBk6y7/CvhVZgLMyuSgYGRU0mlG39E4asjtI63GfZicYv4/3+dHroVuuzj6TrMX5VuBMuCyl5/djN7AG3GyXZuxOdEiItNBw661n0ZtYIizow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL4PR12MB9483.namprd12.prod.outlook.com (2603:10b6:208:590::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 07:56:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 07:56:50 +0000
Message-ID: <1405f2c3-ffde-4084-b27c-8b54988415a6@amd.com>
Date: Tue, 24 Feb 2026 08:56:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/62] dma-buf: Convert dma_buf_import_sync_file() to the
 early-return style
To: Bart Van Assche <bvanassche@acm.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
References: <20260223214950.2153735-1-bvanassche@acm.org>
 <20260223214950.2153735-6-bvanassche@acm.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260223214950.2153735-6-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL4PR12MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: 5425830a-d476-429d-5695-08de737a43f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXFaTDdOcVl3ZkpLU3JONHhQbTR6S2dJWTIwbU5BdHBaTEdrVGdpcVNQUUN6?=
 =?utf-8?B?aTgyTno2eXhDdFkzdy9VT3VhQlZQMFp6VzNjdDE4eTFGZktSZjRoc0w5ODJR?=
 =?utf-8?B?R2pwNno0eTlLSTNZUVVjcjRTbTZBUmZDUkZMdmdZQUQ1NE5keVhHMWRrUits?=
 =?utf-8?B?Skl2cllpdC9tNFlONnhMcm56WE5vUktIN25jRXJLWXpmL3NTNFh1bnI4ajNW?=
 =?utf-8?B?Q3JMUi9BSnhEUkh5dFhDeUwwM09jTmtBeUZQL0QxYVBFZGNUS2JFbHdjRmIw?=
 =?utf-8?B?dHY1R2xjc21kZDVyY0MxK2pvRDJmQzhvQTNKNDdyendjTURwejVWYnFUMTZP?=
 =?utf-8?B?TzhqUzhsOU9lTkVoU2JiUGFUelNrbzUyL0lrVEY1UTJ1dHNvYmdvWEJHRlln?=
 =?utf-8?B?OGI0YXYxbFlxYTI5ZzFzN0R0ZlZlZjArSURDR3p4RWxTK3ZkWDdVd3lHWUl5?=
 =?utf-8?B?K0lENDNqUHErNXJuQTVWT2F2ckdERUFKcDlIZEpmRlhYUGY2ZmZBeWhValVv?=
 =?utf-8?B?RFFPajROM3F4WDJLRDlvdURxVkdxOGxjR0FWUUpFd3VCMXE1dFl1QkZGQ09w?=
 =?utf-8?B?MTZlanY3UWJPUmtGM051TnY4RlE5U3R2bXRtcFNxMTJVd05OYk1QOUhXNDhu?=
 =?utf-8?B?a0lvV1V2dlNrNTF1MDBrQjFIdDNvcWh3dWptQXN4S3lQcDg0dXVrMG1MeEw0?=
 =?utf-8?B?S3M0Yk9HTm5UblBNRXBUVExlUjBsUURlcjErK0pOeDZOSytiVWM3SitjWlhZ?=
 =?utf-8?B?Y0Y1WHhJV1BtcWphTVNoeFNXUHZjbGdaSzNvSDR6N082eS9JQUxrNUVMb3Za?=
 =?utf-8?B?ekJFQjk1UHhxaDFsOTFkeUViVTNhTXhlMWdwTjV6SFdrY1VpOVNoaWQ3NE1x?=
 =?utf-8?B?OXFqTzJNdjdIcndUbm45Z3VEcFYvZXdEOVlFekUvTWdvMVpuTXYrZlYyaTBE?=
 =?utf-8?B?QlZuUlNTTndSdnExNUhIZEVackdrc3dkOS9tQTNoK2FXMExoSzg2NHVPWDF0?=
 =?utf-8?B?aTdLK0RuK0x1OFVESXVHMXJYK1ZqZlNtWTFVTTR1emRERlJhQXZoN3o0NFd5?=
 =?utf-8?B?TWVTNTlXMFZ3bEZpa3NVaXAvcEVnRkNIVDUrOGVIMTVoZDJmN3BDNG5DVWlB?=
 =?utf-8?B?NExCejVxdWlqQ1ZTc0VBblorSDhOb0NWMTg1SDB1dUErRmFNczRES3pVNGFk?=
 =?utf-8?B?SkFnY0xWMktnSytmUHh2WjdrWkhxdHJlMGRBL2ZJb2tKK1BWaXlnaEdXWkgy?=
 =?utf-8?B?eW5CTDgwNVN2a3FGS0h4UW54T3JYbldjcDFzZDJPdDJ4dFc0QWhVYmU0NjZi?=
 =?utf-8?B?LzRSR04xVmliUFY5TzMwRlIwbnVxVHpadC80ZGRaNVhycjZjd2htai94YVdD?=
 =?utf-8?B?N2dMVEFSL3FxVVRLU0RDWjE0TEliMFI0WmhMNnRjR0U2em84VGdaTi9ocVJw?=
 =?utf-8?B?dkl2eERRU1lYWmRNbTU5Rmh3Ymp4ajBxdnQ3TXRjNTFDQWtJKzZqTFQ5dEV4?=
 =?utf-8?B?K0xVL210TDJvQnlFVkNVNnVJOG4zRXh6d212YmdMYTFIRzhmRDltTkcwSWNn?=
 =?utf-8?B?VWduR3hkUWxtMFRPZ2FtdEtjSnJ0WUZkV2tJQXJNcWN2bm1VK09ZM1prYzlX?=
 =?utf-8?B?dWpTZTQ4Yi9PNmlaNkc4TzBNMEY0T28vbG1wbVJzb282SEpkSGtqb1k5dmhs?=
 =?utf-8?B?TmkwNzdMTlhJRnEyMVAyQUlYMHBuMnd4TmpjZ2ZHbXI1dzB5NE9PNCtpVEZP?=
 =?utf-8?B?REg1M1pkNUo0YjQreWpic1ZNakQrSVB4N2RSL3VhVlNlcVpqcXREdlpJUGxT?=
 =?utf-8?B?QmFJV3ZRVFE1bUZ1RDJrZitFaTlaWTJpN3ZmQm82d3Brcjgvc29pVW16SzRF?=
 =?utf-8?B?cFFBa2wzUlNWZDFLWUdCMi9DendVa2xqRDd0T1k3S0dyNU9oc3JmWU9vcERY?=
 =?utf-8?B?QmFpelhYOHJpYlM5Q0VCZThPSzEvaUk0dnh6bmE3OHpGR2t6TXNxNDhOQWZ5?=
 =?utf-8?B?bnBNcGk5WlJpQ0QzZFNXNDU1VERNdjIrWlJ0SC9PU2xLSVdEL3RrZEw5ZHk3?=
 =?utf-8?B?NDFaSjVTcTEzUHIraGtKd0JrUm9EOGpjL1owV1UyWHNJOWRUMElDak9yVXVp?=
 =?utf-8?Q?iHlc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVpOM2MrbE9qVkNPZkxCZS9NTFJnODlicGFJMXV3WUllbEdCZmNkVlFxRTNN?=
 =?utf-8?B?UlFKejI1NHpkNEQ0NUdFVFoxQnZOeGZDRnd3ak9iZ3ozdC9vWmdhdWlOdXRz?=
 =?utf-8?B?Zy9mRnpvOU9RaWlCRXhCLzE4bUtIcGZQWGZ3alZ2QlBDUWpPaTU3eURqaXpa?=
 =?utf-8?B?WGZPQWF1bkJzREhic3lYVmxWN2RuVlJDbEtMbHQ3WmFmRGx1SWtRdmZWbHZl?=
 =?utf-8?B?SWZ2ZjFVcmdPcmhkRm1oU1JQdit5TXBvWnF4T1R5UkNHTjhnN05HQVF4VEU1?=
 =?utf-8?B?VmIrY2JLMVpHNFZUZzVyTzVrTlBKb1dpdDVUQ08zcHFmZm1WMzhJdEczeWht?=
 =?utf-8?B?bDlVZERxSVJrWHY4N0I5UTRHcmJlV2t3d1VTSUlTRFhaNTVlNFdKSWNkeVZ3?=
 =?utf-8?B?U2lCZmw2cWt5K1creXVyYkczTnU2WDlKZDBQZG9LdWxGVDVRTTd3TmxJVDlE?=
 =?utf-8?B?SVgzZlZRYm50bmxWdmVmdGJGcklBc0hhWWFiRGpyV2xzS1NnV0dVd0hKZGMy?=
 =?utf-8?B?WWQ1SHVreGYzbEhZYnQ0ME1TT0QyMGJSS2ZhbW1PR1ZIMDJsYi95M2FXWU1B?=
 =?utf-8?B?dUxqRzI1aGJIMnJoWVZhV01QTlFlb2lKSXlsY3JFY1JRWDJFVTFLRDF6TXNY?=
 =?utf-8?B?U1lMRHBGdUM4VEN6UitUWFFDWEhoemN1cDVSZXdLMWk2ZS8yVlYveS9HeHRO?=
 =?utf-8?B?ZyswaUM0czZ4cmppUDB3OTV1WVNseStDcThpZFRvYjNyWXpHVFF0cUF6UjRW?=
 =?utf-8?B?YUxCcHBTeSttZDRMUHl4RGgzU2dnTm1ydS9uTWlHQ1hOUEVhZjlnZ3R2eG1B?=
 =?utf-8?B?dVJtT1Y5RXdlckNUblQ0QmhrakVxbEd6K1hrMDZOVGJ1eHg0eWxaRk9YOG9F?=
 =?utf-8?B?ZWlwNS8zNFJhRnlzWW8vaHJMUjh6RWdDTmhQVysxejdKekkyR2NXUHM3UTJ0?=
 =?utf-8?B?MGVVeXBqU21QR1Y2ck96OE1nWEJXRmJ2bXh2M2k1c0FMZXl0VkIxbjgySmJ6?=
 =?utf-8?B?YzBQZHBQUVBmclY2cEh6TmsvbG5CUDZCMHN3TUg0QTdjd1QyckVLRUFzNmRV?=
 =?utf-8?B?bUlETEZKMkJhNitKNzhKTkloRFBvNk83UG1MQjJtMFJuTS9IODdBNC9Ybys3?=
 =?utf-8?B?NVlwSSt2MURkYVBHY0dQMG8wQ2w5TnBES3JybndZcDVkclN4TGtsRTBTVEZ4?=
 =?utf-8?B?RGpDU1Q0dldCbXBVdzhzNkE3aWdUWDYybTFnQTlGZTdMdGlyNkhtVjRES05M?=
 =?utf-8?B?RVRtcFNjN1hRUmxrQTVLejgxL3dPZFlwNHFFcEFZblg2eVE2T3pCY2wyejBu?=
 =?utf-8?B?aUdwSDE1WXp2bi9HVUxpdG5Gdm5QTTVEMTJmQ1hPcXU4RzlaTWxEem5yR2xJ?=
 =?utf-8?B?Y0UwRy93MkNJdVFXZjZqT2h1NUtHcmxuSVRlSTd1ejlFNlBMKzQzVDVQQk9Y?=
 =?utf-8?B?MmNydFVWMGRDdXNMVXloQVNYSkVUV3dMZUlWdHFCNTNxZ1BaN2g5OE14QTJt?=
 =?utf-8?B?OU4vMG5JdXo0SU9BT0JoOTlubmRTd2dWQkwrYjdZM2pYcFFmUWtNdUJYZzRo?=
 =?utf-8?B?aHF3SWlOOGtRR01vM3VaRlcvSWhtUHdxN1dZdEQxSGRTTzB3VElVekVlVTFi?=
 =?utf-8?B?Y1YrNzlaNlNtTk9FQWNKM3NxbjNhazBQTkJDUk92YlF4QkI2RkNHOXNjVUx0?=
 =?utf-8?B?dEdrV0Zjcm9VbFlpaVdvWVlNZ2pINGRHTS9ud2p1ZFU4WVUzZ1VGaWNZOXVO?=
 =?utf-8?B?UzRaTzJuNENiK2dZVGE3amdFVWVqeWM1TSthdTJPZnJBamhka2FTcmdwby9Y?=
 =?utf-8?B?VUN2YnN3VEVpbXdTaStPdnhONUJjSkZmVXFncE14OEhEL09xSFBZZjFMVElj?=
 =?utf-8?B?Y0YxUlRPTjdUbk8vUWVnTkliS0xtY1NHMmdmajQ0eTZKNXd4K0RaOU5QUjNR?=
 =?utf-8?B?U3VQa0tnNlcvd1lHYkVDYUNYWlVid3BLR09GcnhET2NWdVFFL0FXeGdrNyt5?=
 =?utf-8?B?Y0hKaHBIdGNPQ0daYnFBK0toSnBiWVJEZnZWeWZVeCs5enJiV0pJcUJUNUtD?=
 =?utf-8?B?aWJoMnV2TmR1U2NsVjMzNk41b2UzaFJ2L3JoZGpjU2VadXl1U1BVeFBQaWxv?=
 =?utf-8?B?OTZCMFhrYWZ6dVp0TitaUU83Vk8xSVp1WkZ0cmVGRjBsTmwyU1lhUTdJMCtp?=
 =?utf-8?B?NktnRy9ua2FXSmtOOWxYWVQ4NkttNHFWS0FhaWJ5Skx1WGxKU2tBRmNyTDd6?=
 =?utf-8?B?S1NPZlpsa3REeXdsSWJ6NjY3eWloTXhpc1gzYVFUL2hCS1h4OEJkdm4rcy9S?=
 =?utf-8?Q?bVnIZXTARVSH2WHbF5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5425830a-d476-429d-5695-08de737a43f7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 07:56:50.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZsOkKXOoPuvOycVYEhsmb64s4Xf//IdfGkqoPJXn+7GBTi2B0snQGMgnHPIX+TD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9483
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53269-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acm.org:email]
X-Rspamd-Queue-Id: 9876B183569
X-Rspamd-Action: no action

On 2/23/26 22:48, Bart Van Assche wrote:
> Before making changes in dma_buf_import_sync_file(), convert it to
> the early-return coding style. No functionality has been changed.
> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/dma-buf/dma-buf.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 11711874a325..1666133ac8b8 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -523,11 +523,13 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
>                 dma_resv_lock(dmabuf->resv, NULL);
> 
>                 ret = dma_resv_reserve_fences(dmabuf->resv, num_fences);
> -               if (!ret) {
> -                       dma_fence_unwrap_for_each(f, &iter, fence)
> -                               dma_resv_add_fence(dmabuf->resv, f, usage);
> -               }
> +               if (ret)
> +                       goto unlock;
> +
> +               dma_fence_unwrap_for_each(f, &iter, fence)
> +                       dma_resv_add_fence(dmabuf->resv, f, usage);

Mhm, I don't see what this is good for?

While this might look a little bit nicer we don't enforce this coding style and it adds more loc.

Regards,
Christian.

> 
> +unlock:
>                 dma_resv_unlock(dmabuf->resv);
>         }
> 


