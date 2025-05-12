Return-Path: <linux-media+bounces-32301-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D01AB351D
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 12:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6FE3AED4E
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EF6267AE3;
	Mon, 12 May 2025 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b="CNDMQgWf"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2117.outbound.protection.outlook.com [40.107.21.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC3126773A;
	Mon, 12 May 2025 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046615; cv=fail; b=PNjFUUkm/0mEjhuXhyy7pV2vBcSSSpiy756JNGvXSewX2H5YJoZWYr6FEy4PDW1/sGZYpDgzwcqGjawLgtwvf0e1GkKz5IdrHAFWHaat++Dwck2uvQBkHWQSN64QghdRFNCdJxLqsCHctZYY7aQbIPMwD8Q1u/csymBKY8srZuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046615; c=relaxed/simple;
	bh=vRSFnJ4lgWx3v5QFxRL+Qi7ASomLp0l8hhzazkpttDA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e6s6T8DqZn0Y016U4Gu26ut7FTS/gUlfY3Z5tZXXjLFQJfRvsDQmfas7ASN1jc8MgntmTu4zW4HSFylPFSSz1cnEJQjkipSgFi14hjPID1E82xVO38cZN9gYrqnZgmKMUEk6DEN4E/eNEB2ONWV87u+kKcSG//UwDZojD2U9Pw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no; spf=fail smtp.mailfrom=neat.no; dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b=CNDMQgWf; arc=fail smtp.client-ip=40.107.21.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=neat.no
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnF+cMjqCh95qMr6T0A6YAsZylCfPxSti1VWjKjl7zUzUayySAZkft6eFJe/hEEhdUSRDDgfl56isvVvQTSXSbzDJEeVh7SO+OP7O4dDW+7mCwLItlyDhgtvb9VUbcz8KEsQrFwIgGshH6JKrXVbdpWjKDhV7sJJVBNGYz+wuigHARMIg0lQ+a6v8jj8WCFgFxF5KbMbr5udoYJDHwJzVxp97TcXhh/8FZTEiNiO8pCbUPGfIio8gmShX7CQPBU62FbX4i8GpeJ7CIpanPjaGlhvQWXa7+bJw+D54FVJIRtZIy0wF/3uaZQ+vMxcia+6WuNwezOzjQIHr7hb5KbWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87NvKfBlCNihuIGF7XoQadNVgxJgMUNv/IgzQRt+nGg=;
 b=N/EqoMAB27m7EhkDbhwNEzEcEzHRplR6epWRwhutBVgRs0xcdgp/eUV5vxtrYGs4fyUHm8/ConZPYuQILMk3NRTHTBMWCwyOcSkRhU/tvkxKgR2n/ssSIcPoScDeVbn2U0wiFwZHtUQiWJAD+GIOEj7lf88C0WGi6XX3AMXF+MzRYiW7ASvIuiP/cp5SZeEjDhjjLFzE/1sqSIDX5rFMs1o+QUeeMCTVqPdx4bRLRfth6icE8iofSpxEyLvjPCBAy5bTop70e8EpIKS9T/RP4jG/WNnrA0RYzhm7MrttRd/V/qOLy4BGeVf6Ca0xXWQ2PvWNQZ2ittQGY1lwgCXc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neat.no; dmarc=pass action=none header.from=neat.no; dkim=pass
 header.d=neat.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neat.no; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87NvKfBlCNihuIGF7XoQadNVgxJgMUNv/IgzQRt+nGg=;
 b=CNDMQgWf5hIhk0dpNnKS4+KR/d8jPaT04Cf6DVCnkpsYh6wMil+PCpis/1gDbXGiCQDg1rOCiw5+PTTaRQVuLYpHeyTFybVA9EPdtq1Pa2r0xE7HQQemhKJCwYKyK0nAttdKu+KWQNb8QwqzgxGo2kseZGQZUlb4LuCkzQLN4cgqj6bElXbLkr1ee9j9TwCf+cGHramZ8WcSntW4Ry8znivtKedo9sceUyGqE3mf/m7irgw0H2D9Dp2TfBGdObRBqMUlpo7H2ZNc7yMmF+fu3ZC6FkCs2IggyJV0jZe28ifVAJjDFNhnXZyC6oa8rRteSkwB1I3NB2yjmUGshPaTXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neat.no;
Received: from PAXP251MB0209.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:207::12)
 by GV2P251MB0899.EURP251.PROD.OUTLOOK.COM (2603:10a6:150:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 10:43:26 +0000
Received: from PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
 ([fe80::a426:ce2b:45e1:5342]) by PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
 ([fe80::a426:ce2b:45e1:5342%3]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 10:43:25 +0000
Message-ID: <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
Date: Mon, 12 May 2025 12:43:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-usb@vger.kernel.org,
 linux-media@vger.kernel.org, balbi@kernel.org, paul.elder@ideasonboard.com,
 kernel@pengutronix.de, nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
Content-Language: en-US
From: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
In-Reply-To: <2025051253-trimmer-displease-1dde@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:207::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP251MB0209:EE_|GV2P251MB0899:EE_
X-MS-Office365-Filtering-Correlation-Id: c1ca618e-64ef-4b5d-8e42-08dd9141d31e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2JQZ2tCUTgxamJNUHJDNS9MSW1GVjRyTUYrNllXOHV5MUp2dnRmcS9JUXVz?=
 =?utf-8?B?QVpwVk02ZmNRSXBnZ1puMjhmNFl5SnNZTThDM2hTRFFEeUdyYU1tKzkxSXBS?=
 =?utf-8?B?am1WY2F6K3FUOFdDdlU5QnREanZ5ZExENEJXaGx6eGJodno0MTV0M1ZyeXk2?=
 =?utf-8?B?cDVtc0NwdXNoOEIzTFZ0UEZsR2g2QTQ3OFNSU2RGQVVKNnhVLzFNK2NPUmZ4?=
 =?utf-8?B?TzFob2d0WHJ5cjBPbUwxWGQ5aVBJN093emxkdDluSmN1OVpFbFlLRitsV2Fp?=
 =?utf-8?B?b09GTmdYQ1RtVHNuSk9DUnBSU0NETGE0cmY0NVhkMGdlNmlvMmNvTjNsMm9r?=
 =?utf-8?B?cUwxdUlsSEVGczJRTWZKSG5GZFM1ZTlaN1lDbENEWDFmRlhMUHpYYk5hOEVt?=
 =?utf-8?B?VExWRDJzdm54ZlhUVzNPZ0lVT29vb20vQnR0LzVLalhsb0l3cTc1dDFwdVdm?=
 =?utf-8?B?d0didmo1SUpGQUQ3L0pLV0NSdENIeWdHUXpjdHZqUGJKTW5vSTA0UzE1dmFy?=
 =?utf-8?B?QXBuNUtQNjRUL2JCRlV0K2t1dFo5dENyK0pPVStCWlpROVNzNE0yL25pdzdK?=
 =?utf-8?B?RWJTTWo4YUlVR0hVZk5ob2NjRUhyWFFkTjFURVhxOEpCZHRUekRIUmdBa29z?=
 =?utf-8?B?Y2FvVkIxSFBDZXFrTVBZSHRVY05aL2ZyT1pkUnYyY3YvUDBwWlZZbzBKZlhk?=
 =?utf-8?B?aS9oVHlIbTR5V2FnUy9sYkVneHN3MDdUM3dNWVM2WE9saGRRb0JtVmhyK0Zn?=
 =?utf-8?B?eGxkaGM1eUFQZDhGSVRqTEE2NjR5UE5Xd256Y0pURjlma0czTGFQZlgwTlZy?=
 =?utf-8?B?OGF3WEFucUFtUmwrOXpzcHZDemQwVzltaFpwblQ1Y1pzTlFsNlFnUW9QZFpH?=
 =?utf-8?B?b1ppaUpUaC9LV29HblllUXR5NzZQRUp2c1IrNmx5QWRYLzJFWk55VHI4bm1a?=
 =?utf-8?B?bURYRnFGSkhSQ1hza2h6ZktDaExzNWV2TzluNTVWcGRHbkNObzh4R29NckNS?=
 =?utf-8?B?d2NiQ2pyRlphVk84cUdvOCtlMnlwb3pTQm1jQ0tCTEo2bGRSeFA0T3hHQWk2?=
 =?utf-8?B?czFXNU1XWWFWQmJsM2hWZGJwRUNvazJoNWk4S1RBWTBrZmhrZHEyTEdDamtY?=
 =?utf-8?B?c0hZUFZnWXhhd1RqRlFzOVdsWld4Z3hseERBWG5sZUY1SmN2THAzN2N1NFRC?=
 =?utf-8?B?blJ1MG9vRU1ZWGRYdExTaFkyQU1JM21mSEdjQmlpTnZES0VtYjkrTi9HNFJB?=
 =?utf-8?B?ZlFkZWR6b0JCMmNSdWNwMkJNSVlPbG81QnRteGFpenZDZzVWV0xHYko5bmwr?=
 =?utf-8?B?QXVtTFQwbUU4cDR1T29DNUwwWGIyOXZtQ0NoY3FhN1VLcHVHMXdxRzZUa2wv?=
 =?utf-8?B?WGtrSHJ2TjFWaHdEbi8vbzNuZVN3WGdWRy9QMHVHS1hBT3dXQWtuQkpzU1R6?=
 =?utf-8?B?aHJDTDVnem43Smw5RGRlQmx2OHJvNWp0cWEwQjJvOUY4NFJ3d05LaGx2dEF3?=
 =?utf-8?B?THlLWDZvN3IxTTlteFhrOWpZd2JlWFZkRURUT09lUit3U0JmMk9yaC96cEtx?=
 =?utf-8?B?bjNyYkxlazl3MmlRNG83R1d1S1ZrQ0ZVQTZxUzAxZTF4NU9rRTFwcEJpbEo1?=
 =?utf-8?B?Y1JaaWh6YUZmbTNVR0Nycys3N1Fab1N1Z1YwL2FPbkNkeEZ2dDF6dC9ZVzA5?=
 =?utf-8?B?N0E0b3VWaW1JSDBzNE9XbWpyUUtXL3RSM2hmZm9XQ1ZBOEtxcXRyVnExRWll?=
 =?utf-8?B?SDRrTS8vYWc3Y2l2blVXR1c3NW1hWm9hbHNERG8wcFFmSktMV24vVnVvYXJ5?=
 =?utf-8?Q?I4GMKXvPZEh8FXJqDJw9Rqfu52F7R96BsnueA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP251MB0209.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3A2SHRHY2NhZ2Voc0FzYVdLa0g5ODU3a0lScHI4MEI0bHBTbTlyb2dwWVls?=
 =?utf-8?B?N0J6Z1lCSWxOTzNwUU84bFhtSTI3S0FwOWNYb01hV2lONWZuZkM3M0pHLzlN?=
 =?utf-8?B?bDlWUEphVWFIYzRaNDhEMmZ2c2dvUW9pcG8vWUZWUTliRDd4S2RMK1JjL1hT?=
 =?utf-8?B?TGhTMkRLbkh2U21TRnN3WW9LdDY5MHpncmFFSmlSTUczUXd5LzVodVVPRHJv?=
 =?utf-8?B?WGcrTTc2Qk9SN1JRTE55YTZkdEJCMlpqK2VROVpSL1djNWU5d3hmOEs3T1BW?=
 =?utf-8?B?c3I3UE1BUFN6Uk5yWkljV0VtMUd6SjJNejB4bVBXbDNKazVOMVJIcngzVFhv?=
 =?utf-8?B?Zy9SUXlHTjVldlQwRkNqZEhPSTVMQ2Yvc0Y5bmNobHNCYTFGUk5sbmVCWWlN?=
 =?utf-8?B?MTY0b3pWWFl1Z1AvVWcrWXYwdEJoaUMvamZuVmY2ZHVaTnFXUmlMVHRFK2o0?=
 =?utf-8?B?SWFybWJXZm5TYy96bnUrZC9JVTlFaGxMdXZXbE9TWGYzUGlZTHYrYTVpWFVa?=
 =?utf-8?B?aVF1c2FPWVBrYysyWENGOXR4eHpQTTR3QzNsOVlGeDJMR0xyZkdsV2Ewdzgv?=
 =?utf-8?B?TlQ3ZFViZUtHOU8wVmxxZXhjM0tpN2FZUFlXZXdNdVJDNFRDYlhZK3RkekVJ?=
 =?utf-8?B?RXE4eHovNCtmR1FvN05JaXI1ZFYzSUxJdFk0RjhIQXhVYkVBR3VwMi81cWNG?=
 =?utf-8?B?Zm1iK0pBVmE2NDZnUVlQd1drMERncDBCaWtKdzRkMEtIL1VuRUdON2tlOEdI?=
 =?utf-8?B?WkZZV21jZU1XMllZSWxpaENKVVpyUzlKUVNldHJwQlBCMzVyTnFQVHhmckkv?=
 =?utf-8?B?djQwS0RBZCs0YUovblBFWFc3RGNqWWJ2ZXJ2SzMreW1VSnVKRU9MczBUekx1?=
 =?utf-8?B?UFBRRXowS3RLUnlrM3pDRHVDWXZ4cmdjZHQ5SFJsdW53bEcrNzBSamNNS2tB?=
 =?utf-8?B?VVcxbk5ZWE0xNGNmQ2VuWWtVNTR1YjlaT25KYUhZb1orZ2hmMk1GTGQrQ2lD?=
 =?utf-8?B?ZlhKd3VwREk5T29aT0E3a3orUlg3UFQxZFE5V1lkMnR6blRPdElQVG8xZzdt?=
 =?utf-8?B?dk5SMkNoemdDNGZ1ZjFCc0gxdUIvWE5ZREJVdmVKZUlOZVFWRDBRZTlkMm45?=
 =?utf-8?B?SEVaMFpSU1FvMnZ6c2ZSQ3c0elovdVN1VmxUM3VTZFVHWjEyd25xWXJ5Rk1p?=
 =?utf-8?B?NDkwNUZTcUdjb0E3SEk0THJLMExuRDF1dkNpTWYwSXREZEhpWkVndFV5WU5C?=
 =?utf-8?B?NG5URHhnTzhVYnRiUGNvaVoxQUw4RDJzczR5WmpFUFg0c0o5S3YxNDFYWmZ4?=
 =?utf-8?B?eUVyWDBacmNHMTNMYSsrUW9IdU9KNytlYndzNmlobFZ1NXJqdlZGNWNIMExP?=
 =?utf-8?B?Y2djeDZuMmtIL0VqVmRUbkJJSG5JRnZqaElyUEVZV21rdEhXQWw5T29DNlZL?=
 =?utf-8?B?T1VSVmJCUUViaHVtelowUDJUYWlRc1l1L2J0QTlXM1VES0ljWHpVUGg5UlRl?=
 =?utf-8?B?UFZ1VldqTGZ4U3V3V0EzNTVRSDBtc0hBK3dURFhnWjNndndFajZFbUhML0RL?=
 =?utf-8?B?U09Ec3lBb0tDeFRiMDFkUDRYS0hWeU5DQ2htajdqRkNMRmY4VjhNMFZ0eXow?=
 =?utf-8?B?QzNPemdsalRzSFRoZk1zOVQ0YXZYcmZtMTlIcmFpekp3a3lYUkdjYlRJTGdJ?=
 =?utf-8?B?NUpETnV5b2U1VVd2aVl6MElKMkZoVHlXbTRTQnpkYXFtWmZJM1ZZTkxpaHkw?=
 =?utf-8?B?bG1NZTlGT3hyZTh5dGM0akZSL2pDZFRMeFI4ZW1WYlJjNm1CbVdhVk0zdFU1?=
 =?utf-8?B?a285VzQ5S3FIRm9FZW9aKzI2Y1RHaVVUamo5My9tVktKV2VyN1FzTVlLZkNx?=
 =?utf-8?B?TnE0azI3a2t5VkFMWEsyRjI2RVk4UjFVSFVqdm5mNkVyeFoxNytSWUg4eld0?=
 =?utf-8?B?WW84QjQ0TzAvQ2JNQnVHSmxCSUU0MHVOVEdLaS9pMEIzRDlvdWx1OXBJRXgr?=
 =?utf-8?B?a21XdnluVWV1TWNGMktWekhwRTRBdTc0SHNVNlpoY0pzK0U2aWNzSlNsRU1u?=
 =?utf-8?B?ZWEvRDdCSHlyZmJ6aE9oRnRGK0ZlUHFTSzR4bXFJcEtJVFViOTM4VjRRT081?=
 =?utf-8?B?Vmo1K0gzTTAyV2F6L3hvSXppOVcvRTZzaHAxN2RUcTlOQ09sMHRXMkZ4RHVm?=
 =?utf-8?B?T3c9PQ==?=
X-OriginatorOrg: neat.no
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ca618e-64ef-4b5d-8e42-08dd9141d31e
X-MS-Exchange-CrossTenant-AuthSource: PAXP251MB0209.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 10:43:25.8668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 029c40c7-2844-4bf3-9532-45d5eff8c8f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bs+ac1ezwMAGARxp3ZXcnEzcwLV5Ky8NlvOrAnC3ix2vW15DCaHcRvpCFi2mr33EI698kGuYnjDrdlErTOtyxawfVyFamjYrVORR+yw7Rlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P251MB0899

On 12.05.2025 12:38, Greg KH wrote:
> On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
>> Hi Greg,
>>
>> On 4.12.2022 09:29, Greg KH wrote:
>>> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>>>> Hi Michael,
>>>>
>>>> On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
>>>>> This series improves the uvc video gadget by parsing the configfs
>>>>> entries. With the configfs data, the userspace now is able to use simple
>>>>> v4l2 api calls like enum and try_format to check for valid configurations
>>>>> initially set by configfs.
>>>>
>>>> I've realized that this whole series got merged, despite my multiple
>>>> attempts to explain why I think it's not a good idea. The UVC gadget
>>>> requires userspace support, and there's no point in trying to move all
>>>> these things to the kernel side. It only bloats the kernel, makes the
>>>> code more complex, more difficult to maintain, and will make UVC 1.5
>>>> support more difficult.
>>>
>>> I can easily revert them, but I did not see any objections to them
>>> originally and so I merged them as is the normal method :)
>>>
>>
>> I know that it's already 2025 and I'm very late to the game but this series
>> breaks our userspace scripts as it implicitly adds a requirement to name a
>> streaming header directory as "h" which previously was a user-selected name.
>> This requirement is coming from here:
>>
>> +
>> +       streaming = config_group_find_item(&opts->func_inst.group,
>> "streaming");
>> +       if (!streaming)
>> +               goto err_config;
>> +
>> +       header = config_group_find_item(to_config_group(streaming),
>> "header");
>> +       config_item_put(streaming);
>> +       if (!header)
>> +               goto err_config;
>> +
>> +       h = config_group_find_item(to_config_group(header), "h");
>> +       config_item_put(header);
>> +       if (!h)
>> +               goto err_config;
>>
>> If you name this directory as "header" gadget just fails to link to a
>> configuration. Although this isn't a big deal on its own as we could simply
>> rename the dir in our code but this is just the tip of the iceberg.
>>
>> To my understanding, this patch broke an important feature of UVC ConfigFS
>> interface which is allowing to present different list of available formats
>> for different USB speeds as for example, it does not make sense to expose
>> 1080p30 in high speed as it simply just does not fit into the ISO bandwidth
>> of HS. For example what we've been using previously:
>>
>> mkdir uvc.nf/streaming/uncompressed/hsu
>> mkdir uvc.nf/streaming/uncompressed/hsu/360p
>>
>> mkdir uvc.nf/streaming/uncompressed/ssu
>> mkdir uvc.nf/streaming/uncompressed/ssu/360p
>> mkdir uvc.nf/streaming/uncompressed/ssu/720p
>> mkdir uvc.nf/streaming/uncompressed/ssu/1080p
>>
>> symlink uvc.nf/streaming/uncompressed/hsu \
>>          uvc.nf/streaming/header/hsh/hsu
>>
>> symlink uvc.nf/streaming/uncompressed/ssu \
>>          uvc.nf/streaming/header/ssh/hsu
>>
>> symlink uvc.nf/streaming/header/hsh \
>>          uvc.nf/streaming/class/hs/h
>> symlink uvc.nf/streaming/header/ssh \
>>          uvc.nf/streaming/class/ss/h
>>
>> no longer works as the patch requires presence of "h" directory inside
>> "streaming/header" and even if we rename one of the headers directory to h
>> the patch would be actually wrong as it would expose via v4l2 calls only
>> formats available in the "h" directory and not in any other. (and at least
>> on our adroid kernel it makes the kernel crash but haven't tested if that
>> would be the case for mainline as well)
>>
>> Given the limitations of the v4l2 interface I kind of don't see a way how we
>> could fix this series to present proper formats to the userspace using v4l2
>> calls as the list of formats can change when the speed changes and userspace
>> would have no way of knowing that.
>>
>> Given that I'd like to suggest that it seems to actually make sense to
>> revert this unless there are some ideas how to fix it.
> 
> Sorry about this, can you submit a patch series that reverts the
> offending commits?  As it was years ago, I don't exactly know what you
> are referring to anymore.
> 

Sure! Will do.

-- 
Krzysztof Opasiak | R&D Team
neat.

