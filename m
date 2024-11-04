Return-Path: <linux-media+bounces-20734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F39BAA21
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 02:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872CE1F213D0
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 01:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0F41531DC;
	Mon,  4 Nov 2024 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="plKPYSGl"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4077142040
	for <linux-media@vger.Kernel.org>; Mon,  4 Nov 2024 01:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730683459; cv=fail; b=Qd9tmK1lRnq1WNDqUChnmfqtxrF2w4+2pCv3HBn5/DlXoNZeJknVQmDKGNjbgWeNdRoKfF8RUUAtAJZcbdolHbmCIQ7z9Oz9SAsEahibcjpb0c49toQK3Ql5vQcVwKS6HrnV7QoGq/PHc06bPx2PlmaGibYT3TFwdkOmIDYfETs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730683459; c=relaxed/simple;
	bh=1dyWfnuHYQ6Tw5BGpqeWI7eNSrXEHHRa37bWs3UNspE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gaGogFhe8jkHMKQFBlg+IV6H1Npye88/9F2N4CSlSuCy+OR81hTAjPUM6xcpSspR71Eg6HKFwPLwquano6vLBszfVX9ZGdFnpJtr8l+RCAedVQsAekIyMJ3i5Ar95oBCBqYl3c/1wGFA6lKmVGEk+tyJiMeTPlURsPppUxaUwNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=plKPYSGl; arc=fail smtp.client-ip=40.107.22.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOXtvlv+NVyQWLfVBN3Yq/5n6VVTyY4Lz7PTTbJGuTK4VZEK+JpSes7/BAU6tPPQBLHgD4mfAJ7DUnV2HnKUGVRXbbhSj7wRcIo8ix2cnazZ8Oi22Gv5yPsYW6uR6jq0bDMK2XT0hLFfjoQ2dEVSVVRsHhPX07alRREu6bD/iAYcJrmYwYj4hkCYMT4LHqfvG4UtzEiLD/Vnrd/6WWSedRWWvQ/dBfLo5jWaR2pxlrjG3QwqUtzRIgBZFEZ96yL4RsiFbZmQqQGcvB7pD6iiMTXvSZpv+Ij5INXNzD7G0t5Xa3Zxx0VO9IMtbixlIF72kxkjTC1EIOkFtNay2Hl2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M3+ZGgYxV5x0RLPH/p/M02VEex7SAc0mDSabbRrYko=;
 b=wHYH6TXjFFSB7XDmrveCF/DGrdTBGDQfeMvpeZFkA+JS4UihB1U4qNTolcKxS/MEfvoRwCkI9tW9wYRLbq6rbRaGnFp8A977VS4gLHdEPKr3jE4TxuzIIza20FM+PEoiv7agYtInAz0wBr/R/bbn4ByFjmnxlkn4z9ya18KwVdzFSz1xvgWF2Bk1dcv+WYQpbpc7hy0rEHavB6g5j1kmWcOtU1cgTasZPqP35QZp68RrbDhCYTCrpNCEpl43XKeV7iG3OfEW8Q/epIoZ+ZSEDF5189Yq0ocIvGDFeIC1xm3g8ukGwgo+6dIjhkA2ELBDBoQu/K6n5oy9K9ldS6ovHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M3+ZGgYxV5x0RLPH/p/M02VEex7SAc0mDSabbRrYko=;
 b=plKPYSGlnesmcIF5AxLxtSXXv8LUAE2iTaON1KykajR6ymM/4rqx/CPC7Vuo1vpY3iCNHi+STfz7XZoZX5AVFHZ3eELerwt1WLiZV79pnvYvY+fKLUZz/jR2bTLm3yGu7/udkCnvgIqNOkzjYYbuciP1SyBB3yz9+57mFJuQDG1nCwFzxRJitmAVGg+W1Y9XW63qU8RvUsVzSsZQMdp4cff8WwSK+OkGjaAg2VYkGlVtWmQaJ1dVQJ1io8vLwwl1V9OCNMB3AZfJKwstvlWhlRU9JO5j+l3azOtQIXhd9AVpLx6NkEm/rwZ5alnruLVaXr7DlWsqFwuzrPE9eZo84g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB9077.eurprd04.prod.outlook.com (2603:10a6:20b:444::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 01:24:12 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 01:24:12 +0000
Message-ID: <8c5f9e10-538d-4dd8-a9ad-f81a5bb08185@oss.nxp.com>
Date: Mon, 4 Nov 2024 09:24:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.Kernel.org,
 tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
 <12913e54-9343-42ab-ab1e-a33656e640af@xs4all.nl>
 <81b3dcb1-3c3a-41bc-895b-05657191b980@oss.nxp.com>
 <20241031093403.GA2473@pendragon.ideasonboard.com>
 <aeff111c-caac-425a-8152-a90ae04980ae@oss.nxp.com>
 <20241031100920.GC2473@pendragon.ideasonboard.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20241031100920.GC2473@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fdfe47-fa69-4797-e0bb-08dcfc6f6322
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a0NDWUJwTmZHcmhHTzVwZXhnRm5xL2hOUmVzbmppdXBIdEpnbEJ2a05kMHMv?=
 =?utf-8?B?a1A3Z1RRQTcwZXpNQ0hSVWhTOGdybjlZbk1OSWZ5MmFDRk5iKzNSank0OFN3?=
 =?utf-8?B?eU5Nb0ovNUtseTB6eTN4OTlpWlJOckNVWG9POTlWSFZuUFYycUUrNzlPWkll?=
 =?utf-8?B?U2JVT3Vwejluc1VSaGVUUjJNTlExb0M5dEY1T3cvRllRcFNRNUxYQnFwdlJX?=
 =?utf-8?B?N3pSenBXeFNTRXJETnQwSk1RYnBmcUlQUjBnb1g5ZHQxMXRTSzRhMzVOVmdK?=
 =?utf-8?B?SXZjQTlzRWhRQmIyQXVpM2FKcGpUSmlFaC9tTkFPVmVwek5XYjlQczdMYjJ3?=
 =?utf-8?B?SCt1ejBqVUxBM1BaMDhuVEVlSUo4NUV1T2puS3p3M0M3eHBnaWVxeE1uZmwy?=
 =?utf-8?B?eVpyZDBnei9DMmd1VmlsWTJFcUhrRnlMSkZJcVRnSEhVQmRRNldqZG01ekJS?=
 =?utf-8?B?d0RTcVFzUnAvQ3FRS2QrZ0xCWnZBSVlwTTlLWFJHdjJIdTAvM1Y5bE5mampB?=
 =?utf-8?B?QmZNY21Sdnd5UktSbDhVeWZxMzRySk50RTVlU3kvaElvSC9OS3A5MEhHUTRS?=
 =?utf-8?B?OFUrbXNIc3NYb1pialAvZEFFaE9QTHJJQ29BMGVvNnJIcEpUMWdtbUlsRXEy?=
 =?utf-8?B?dkFqcUt6cGtuNmFRU1dmOERrc0hUdlEvUkxuTUlLNHVqWGFuYytQem5RTElH?=
 =?utf-8?B?SmM0U201T0F6bzdFVjFHOWo3NDNXWng3eTFZTXU3dHR3dVpKbE1LaUtJYzN1?=
 =?utf-8?B?VmY5aSttd25BYnlGaHVGZDdzN09BczZ3VVpYN1NGT2FPdmJRMnJ0NEg2amdu?=
 =?utf-8?B?dUFYNW5TNFBoSlBxejdJSkdPbHBoREc2MEFGSmlMYmxLZ21RZSsxcEo5Ymlo?=
 =?utf-8?B?ZG1XVVZTcFk4U21ONmdhOUlzd0o5Q2dsUit1MGF0Wktib1FSMmE2cjJubWRy?=
 =?utf-8?B?Qll2Y1NJT0pNcTZoT2x6YlFUay9XR1ZnMEdDUWtHUFpvajIrdVR6cWVzT0xC?=
 =?utf-8?B?TCs0bmtvTThjR0ZRVEU5RHAwL0dld2RhRHQ5Q29OYzFjNURGNVY0cDBobENM?=
 =?utf-8?B?SFUwVW5oUlMrVnhQK2F1bUtFZmVVb3BoRzA5UzZ5NEs3UXlqek8zZ0M4VEFW?=
 =?utf-8?B?aWpFeVdoUHY4bkZubEkxZ3FpSGI0WjlwU0cvMFg2cW5LRXNGT2c1WlU0VzhO?=
 =?utf-8?B?Um5kdnEvbHh4WHR1WWIrZ09WQk55SHpRaWlrSmhtRkpKbjlabjNNWVlENFZD?=
 =?utf-8?B?eHR1TEZjQ1R0cUxNSWNaQlZGNno3MS9OSHNKRWZmRDZUNERBK3hJb2hLVFNU?=
 =?utf-8?B?Z3h2ZCsvWUxUUFVTdkY0d2w5djI5SGxLYnhLQ1g1VFhhOW10TE4rL0JUZWlQ?=
 =?utf-8?B?eXNvTGk5TE5XQnQ0NVZ2M3l5a1YwdkZlSTA0RzlDdWxJQTRKdU5SZlprd3I1?=
 =?utf-8?B?ZXRSQ2ZLZFdjTGNZNWNVYmNyVkN4c2ovSUNYY2tWb1NCTldTalRZbmt2bkFu?=
 =?utf-8?B?d2E5TmxYTmY3L0dNUlJIZytwK051VjdJZGdlL2R3em9JZ3hpa2dtZVl4TExG?=
 =?utf-8?B?ajM4WHMreGIwUEpMd3FsY3M3U1pWb0pYWXhxc1NIN0xLMWoyWHFFYnBXc2w0?=
 =?utf-8?B?Y2ViTEFwVVBmdnMxRGVDYk1BT1hXeE5JNUVLdEMzbGZTUWwvcDEvNjI3emZW?=
 =?utf-8?B?VTZtcXhBZXhUcHNmSTROdUptSTBJQkgvYmlrTzBTVTQzcTVzcGliNnNGZzY5?=
 =?utf-8?Q?S9mjISEEH61qeDUw6GvW1EI/YcQQpT0llBexPoX?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U1d1VHYxS2ZwTkZsb0syd1Y5alBCS2RLYTFiOU91OUpDNzBuSjNydmd5QzE4?=
 =?utf-8?B?TmJwNXJESERMd0l1UlVoMXVXU0VhVnNHcHpTUmNJVExkMGpnbEV5ZFY5aWw3?=
 =?utf-8?B?d1hOSWxuQjA3b3haNkI3RDlIQ29hMkdIcUMyeHd3TDd0RXpEaGt4OHJPZVpm?=
 =?utf-8?B?ZFRwRE9lN1FmcDhZY1NDelNOU3RiMTFLRXE2eXFkVU5LY2ZaWFA0RnpydThs?=
 =?utf-8?B?VGlHbG45SXdaanZQcVFGN05PRjBFdzNzYyt3UERPNm1rejFMeVlCSkh2NHJk?=
 =?utf-8?B?RWo2VHB3NWtoek1wRnV1Q29JWERCbG1sazYwV3I4Mi9qSzdJYUdhdlNKNDR6?=
 =?utf-8?B?cWxwTGVyRjVQUXpMeW56T1IrMlliMDlzS2loWXZJWHBQcjJsNTF2YUppa1ZD?=
 =?utf-8?B?RHZ3bkZYMXI4dFkrMHRNYTdEWFJEU0JURzNvalR3ZEFreEpCTEdVTkIyK0Ns?=
 =?utf-8?B?RndkT0ZVWHJBUkZsK0NrVE9HSFVKS0hKWksvQ2tpbXhUQTg1V1FPWWF4d09B?=
 =?utf-8?B?SlcxR2JvRGJxd2RDSlh4b3BDUk1xOHJmMXQvbXh2cDRYeWMyeTFhblFzODRJ?=
 =?utf-8?B?OXd6TWRScDZsbEJWa1o0clo1YlBHaGl4TTBQV1BTeVBaREFwUHhXMUtFaGZK?=
 =?utf-8?B?R20yOThJM1UvNmFXSlhzbVE2WkQ1UkE5Z2RnckxGUFo3VjNVY0dOR2lnbGxz?=
 =?utf-8?B?aHVZZGNndm9ZNGhOSVpEajZoenJJQTBxZFEyRERoRUlEeUtRYWxObjdUcDBE?=
 =?utf-8?B?WFY4YS85N0xXbzBHRldNRGtlTlNmYVV3NmNwL2NveHJGQzJQMm5ZUElEYm1L?=
 =?utf-8?B?R3l0M1hHcitQY1M0RUkwejlTdDZlUVhITCtRZ3EzaGo3d2Vocm9QbGxMOEVY?=
 =?utf-8?B?QkgxYk14MlZxcHJyTzAzN21ycmMwYXdXTWs5K3dKbGZLN3puMFN4c3lHUzB3?=
 =?utf-8?B?SHZuUGZkeS9BQjEzeW5TNkcvZWVCLzhlWXBBTUlmRTd4NlFVMVQyUW1qTFow?=
 =?utf-8?B?MDVVa21oS3hTNnJBODFHcmtmLzloV29lMDdaU1kvZFNsaWFBNXlnNndWd2dv?=
 =?utf-8?B?VlB5TU85M1VSNnZJSDUvZ2czWEhENXZpUkYvL2ZZRU9GdklORHBkOEx6STJx?=
 =?utf-8?B?M0tRYWtwKzJ5ZDM2OWJRQW93QldibHBLcFQzQnJkRWZrWG9SZm5SdktsMGV1?=
 =?utf-8?B?R2haenVkZ0t6RVpoRTJjOU1JWU00d0hNQkVzL1hqaXdSU3VjejJGVnpUMXRh?=
 =?utf-8?B?R1U2OThySFNBWTBOM2llbmwyaDhYU1NBVDNEa21BdHRSMnFrbGFmNnNIWXlv?=
 =?utf-8?B?bTIxVmp4UW9DSC9Qc3NWcndwSmt4akJUeGN4U2RlM3FwbHJHYnJJeWhVR05Y?=
 =?utf-8?B?Zm1qSHFrbVBBWDVhLzNuR3E3M252K3VCV285SHVYZjNyQW9nbXBGMUxUVTA3?=
 =?utf-8?B?d1NiWnpyWjR3SUZFRmp2dTRRdExZQkFWRW5veGZtRmhsN2FFYzRRWGliSGU2?=
 =?utf-8?B?ZStmYnY2TzY2S2JoU0pRZnJSbDlOQW1iZDZaMFRiU3BkQ2h4SGFqTktZRkh5?=
 =?utf-8?B?QzI3MEoybzR5dlVIMWgxaXJmRVh3d2NNZVVJTkk3MFpwVVZpMHN5VCtCRUIv?=
 =?utf-8?B?ZzJ6eVdVaWs0RU16SGxmM0hNck9KMGoyZmNkTnVhdDBSdW04ejVDS05waFRO?=
 =?utf-8?B?RUpQRU1ZNXNhYStYQlVDTWVOZTI0WXRsdWJQU3dXMkhuOU9ZSElCQ2JDOGQ0?=
 =?utf-8?B?TDhqRjVKS1lobStWQnNQMENuOG90bHhNL1I4eHdVNk5pWkJqMm9JaEJjN25R?=
 =?utf-8?B?dXdjSXR6a0VRVXFxWEhZakYvUEtWVzJtdW5FdFpwVmxsaUQ4OXpnUEVYZ2ox?=
 =?utf-8?B?enRpaGN3TkxVN203Zm5iajlhSlZyVGpDZi9xSDE3OUp3eUpZRG9PWXM0WWpG?=
 =?utf-8?B?LysxTFNoNS9ZYjJTNVQ4QTE2QTM2L01kZFdzZTRSNE9xOFI4Vmd6RnYvWVRN?=
 =?utf-8?B?TVlCVzFHa3NGWDVlSFpBSlBzN3JQenB2eHpZZkdyS0d6aEQybk5rU2d3ZXI0?=
 =?utf-8?B?UjhSN1lGMlFRTVdoL0V2dnpDcUpTODNHd3hISzhjVlFscDBuY2ZsTlhOd1pu?=
 =?utf-8?Q?YFHc9jm90XxciVhBf6/59cqj1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fdfe47-fa69-4797-e0bb-08dcfc6f6322
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 01:24:12.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mro5oWG80+VjCwnAQUudH8yxxcYfPt3JF2kOhXnb2uq+57yfkxzPhnOVkP/9PXkxl7M7X6m80LoLMcWe7wcwig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9077

Hi Laurent and Hans,

On 2024/10/31 18:09, Laurent Pinchart wrote:
> On Thu, Oct 31, 2024 at 05:46:49PM +0800, Ming Qian(OSS) wrote:
>> On 2024/10/31 17:34, Laurent Pinchart wrote:
>>> On Thu, Oct 31, 2024 at 05:19:02PM +0800, Ming Qian(OSS) wrote:
>>>> On 2024/10/30 17:19, Hans Verkuil wrote:
>>>>> On 30/10/2024 10:03, Laurent Pinchart wrote:
>>>>>> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>>>>>>> From: Yunke Cao <yunkec@google.com>
>>>>>>>
>>>>>>> Tested with VIVID
>>>>>>>
>>>>>>>     ./v4l2-ctl -C rect -d 0
>>>>>>> rect: 300x400@200x100
>>>>>>>
>>>>>>>     ./v4l2-ctl -c rect=1000x2000@0x0
>>>>>>>     ./v4l2-ctl -C rect -d 0
>>>>>>> rect: 1000x2000@0x0
>>>>>>>
>>>>>>> Signed-off-by: Yunke Cao <yunkec@google.com>
>>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>> ---
>>>>>>>     utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>>>>>>     1 file changed, 12 insertions(+)
>>>>>>>
>>>>>>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>> index 40667575fcc7..538e1951cf81 100644
>>>>>>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>>>>>>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>>>>>>     		case V4L2_CTRL_TYPE_AREA:
>>>>>>>     			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>>>>>>     			break;
>>>>>>> +		case V4L2_CTRL_TYPE_RECT:
>>>>>>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
>>>>>>
>>>>>> I find this notation ambiguous, it's not immediately clear when reading
>>>>>> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
>>>>>> or the other way around. media-ctl use (20,20)/10x10 which I think would
>>>>>> be a better notation.
>>>>>
>>>>> Good point, I agree.
>>>>>
>>>>> Ming Qian, can you also update patch 1/4 of the kernel patch series to
>>>>> use the same formatting when logging the V4L2_CTRL_TYPE_RECT value?
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>
>>>> There is a issue in v4l2-utils, that ',' is the ending flag in
>>>> v4l_getsubopt(), then I can't set the rect control,
>>>> for example:
>>>>
>>>> $v4l2-ctl -d 0 -c rect="(0,0)/1000x2000"
>>>> control '0)/1000x2000' without '='
>>>
>>> The should be fixable in v4l_getsubopt().
>>>
>>
>> I can see the following comments of v4l_getsubopt(),
>>
>>      Parse comma separated suboption from *OPTIONP and match against
>>      strings in TOKENS.
>>
>> I am not sure if we can change it.
> 
> I think we can improve quotes handling by considering quoted substrings
> as a single value, ignoring commas. Hans any opinion ?
> 

How about omitting the commas between the brackets when parsing subopt?


>>>>>>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>>>>>>> +			break;
>>>>>>>     		default:
>>>>>>>     			printf("unsupported payload type");
>>>>>>>     			break;
>>>>>>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>>>>>>     	case V4L2_CTRL_TYPE_AREA:
>>>>>>>     		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>>>>>>     		break;
>>>>>>> +	case V4L2_CTRL_TYPE_RECT:
>>>>>>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>>>>>>> +		break;
>>>>>>>     	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>>>>>>     		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>>>>>>     		break;
>>>>>>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>>>>>>     					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>>>>>>     					       &ctrl.p_area->width, &ctrl.p_area->height);
>>>>>>>     					break;
>>>>>>> +				case V4L2_CTRL_TYPE_RECT:
>>>>>>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>>>>>>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>>>>>>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>>>>>>> +					break;
>>>>>>>     				default:
>>>>>>>     					fprintf(stderr, "%s: unsupported payload type\n",
>>>>>>>     							qc.name);
> 

