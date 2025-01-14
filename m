Return-Path: <linux-media+bounces-24713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9A3A104E8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 12:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B851631BC
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2025 11:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CA21ADC93;
	Tue, 14 Jan 2025 11:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="mayIXboi"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2123.outbound.protection.outlook.com [40.107.21.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1F1ADC98;
	Tue, 14 Jan 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852535; cv=fail; b=kJoAp4u4SqZwxXLAvxm+DQ7eh3G8M3HC5XDG2I1e39AqiUeW/BiQWl9vijynEe1T6GjXpyBa32JQniTL3jlkz82j+SvbRaWQHLmapmwcNBkmhhWD9k19v0mlWoxu/+xL6vqVem5TlLFXOKGJicwWMK/0erSa2rZcSIO0tZkUUqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852535; c=relaxed/simple;
	bh=7rAGlixgMoQIcgnqrWj33a+GjpgG9kF9iTX56VtgyMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Xp8dGLp2MhYKM6GFER19IfVZBG67TJi7V+aC1p+do5zrzySzouazHVD2bT0lwdyUpMPQazc3kik7znsxROhbmiflhsvYKFsB0yxho9P62THTyodlNbV8bEItkpQX3LJ4j5vvJ4NzdFN/8HGcNHfZ/ayAaxjDUw8fNponKPG/KXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=mayIXboi; arc=fail smtp.client-ip=40.107.21.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPbYSLG+OlICmGLfgTaMSWUj23OjZxO75EXhI98K+wSZ1WWd2anrVHO+t5ISmDvOZPM6IPTUBAP2mLKLqiJNVazuV7EA6MMLLbe/wX4l49GNqf4dG+ygT4OUKcYPe5sLIo6045ZQRLws5xLZisfFZWJQAwytxjfAAXxvEnfyiK8IT0tDUG7oyj4l/XXB/F8VnO5ypjSJ1HXq6zNQny2TPTKDyAu54Cw2vSSV1/jgm8MTHDvLpHAJkGxgSCy57nC8qpVcZj29xFIVUxnBuI1O1v+6PEhYUyHnZvWbNdjGeU/T7esQVRyL6PPPuqJo3go2TC64EBZyV7gSWrpa4M/ahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rAGlixgMoQIcgnqrWj33a+GjpgG9kF9iTX56VtgyMc=;
 b=jyj0OO2M4MNMXr1kcuszBUiDmXa/TOGCp+HhH/E8TVUl9V+Q67CkICUlPYnWafT+3bndkhETLO8hC3lYXIAvA2MN1WMp4Zew0KJkxtkmRAOdHmRM3qoayNnZcSSlKDV0g08ky9i0wARPDw/OjqJmvjtqOGwpQqP0USS2YghoD4jLsbqKB5bAIAgIGmio+t9XnPo0ciynJdJiZWFn+WBv9dVSFfyA/TlpFCBsEbwj4MPsTJjq9cNr10/ntcWf/JpPohu7a2VmXORi7kMzcmVENvTfzfprtgYgTQSg0Q2K8ycXDhMNAL8xOyBHUTzBjVjfUBfe7hPxBHFiXvxz4HsZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rAGlixgMoQIcgnqrWj33a+GjpgG9kF9iTX56VtgyMc=;
 b=mayIXboijDsztJxKJor0t78tW1FrWIILex3TN3XuVm5bAjoQuUyX8lJCW2+jyAH3yYZFFWn4i6dc8B06jupHzzsx84bJZc5/xb2cQO/FIfCAesy+MlRWHdSOtUN1rMCvxSunh/mg3kJbeNvcU2rh4/YNeOBrlWzxMMgHtslWBHI=
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by AS2PR08MB9920.eurprd08.prod.outlook.com (2603:10a6:20b:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Tue, 14 Jan
 2025 11:02:09 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%6]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 11:02:09 +0000
From: Gerald Loacker <Gerald.Loacker@wolfvision.net>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Michael Riesch
	<Michael.Riesch@wolfvision.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
Thread-Topic: [PATCH 3/3] media: i2c: imx415: Link frequencies are not
 exclusive to num lanes
Thread-Index: AQHbYogZaUtL6hyt8E6YeASxUXvdwbMWEr9Q
Date: Tue, 14 Jan 2025 11:02:09 +0000
Message-ID:
 <AS4PR08MB773533B9D04BE15F51548FEBF7182@AS4PR08MB7735.eurprd08.prod.outlook.com>
References: <20250109-media-imx415-v1-0-366ba6a234ab@raspberrypi.com>
 <20250109-media-imx415-v1-3-366ba6a234ab@raspberrypi.com>
In-Reply-To: <20250109-media-imx415-v1-3-366ba6a234ab@raspberrypi.com>
Accept-Language: de-AT, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR08MB7735:EE_|AS2PR08MB9920:EE_
x-ms-office365-filtering-correlation-id: 1d72bc43-03b0-4bee-b90c-08dd348ae41b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2tobUVOWlMxS3pkbm1mTTBWY3hXamV0S0N2MStTUDNjc0M4SktzUmhWRzIx?=
 =?utf-8?B?UnJhb2JkdXAxYU0zbDBCK0l3RzdITmtvbnZmSnliN0hLdlJsNDFydjFsY2xP?=
 =?utf-8?B?YzJKVjhNY1ZUSk1YVXErMnJSUVVzenJnNjZINHBDc3BIaktid3dNQTRSOXAw?=
 =?utf-8?B?QkY1KzQwRXR6WVlkd0hueGl1N1ZEalFiOVR5R2tVWmJpVUdXRGp6b2Z6OXpz?=
 =?utf-8?B?MjZFdUN0TWVDWkgxbmJwMTFLRGUzNXk0aGdLUXY0YzhEQk00SjY3eW9OOHFi?=
 =?utf-8?B?cVV0Ym9DSHBrdG4wV0p0U2czSVNLRDRWOGxlNndHYzNPZlZKSWxNWCtNZ2hP?=
 =?utf-8?B?SXpjajlBTlFnem5tbTIxamRaVHNtdW1INHc2L1JkMkFwRHRkRklOWnk5UjBX?=
 =?utf-8?B?QXJuZDI4WjhhMHY2WEJBWHZuYVhQYlA5WHc4UlFqLzk0T2p6QXZvM0ExeEdB?=
 =?utf-8?B?VTY0aXBqaHR3Q3IvYURDdFBDV09FWElhRTB1Q3FiR0VNa3FRWDdvUk9uOUxG?=
 =?utf-8?B?S1lmNGFsb1JKZlZTN1JTYzRoeW9tTU96d3Q1d1FCaG8zZ2xncmNlSzVxZDM0?=
 =?utf-8?B?a3d2eVlPbmNXWnVvT0VFcURnTEFnbkQvS3pLdGdVeWFJYmJzNkhUVVFuUG1h?=
 =?utf-8?B?R1ZvL0RPd1VDU0ZQNjY0NTNWcG03bFFOZ1hETE1XWmVsNEE2eWFHWG9weDJp?=
 =?utf-8?B?ZTU3SFFjWXBycC9hYng3eFZwUjlSVkdoa0R3bDNleFI4T1VPRHA0dEZsV0I0?=
 =?utf-8?B?bEJzaUlTZEZmcnAyeUFrUGZ4WENUaW96RGs0RXZza2EvVGw0emc0YjhuUk9J?=
 =?utf-8?B?VVRSVGF2Y2w3b0VLUmladUtQaU9QWk9hYXJsVFV4YjZuRkp0QzZXZlNBUTRR?=
 =?utf-8?B?cnBmblg4YzYrN1hJRGtKOTg2c1J4bVNobDUxTlZ4MU9nVE1QNGtyS1IwT1J1?=
 =?utf-8?B?ZnNDL282ZTJTZTFXdjRMVitjRXBzbk55QmJIQk9ZNS9DTTRhSG5wU1NpakFx?=
 =?utf-8?B?MnZNVlhvOGFDYWw1bVJuK2dEYVdkVHVCN3QzQ0wzUFpxM0RScHY1UDFzMTJ2?=
 =?utf-8?B?Q2UyazZnalBuOWwvVjM3bjJPWmZybHZLVnJSS2hGSGU0enpJSFdSM1lQY1Zx?=
 =?utf-8?B?WkZITjhoQVorUjFVRDBYRmtadVBDZXJ5K2JVNjdyUnBwcU5UQzhmdVRXelI2?=
 =?utf-8?B?RS9Lc1l5d0hodDF5M2RueXZXNzVTQXo2cG9RR05UUVpFVHExZUg3OVozWnJK?=
 =?utf-8?B?b0FLV3ZoWDNveG1Mb21aWkhNRmRKVzVMSWlYVzBhZzZOUW9RajVFcDZKZHM5?=
 =?utf-8?B?STBjamQ1N1BZQTQzWEZxK3hzWG9WamRrZTJYeDBRT3JFSm5DWmZEeEd0OEcy?=
 =?utf-8?B?YkdyL3VITjdOVmFrbmRPeFhHYVlaT3Z4dDVCZWgvRUwwR1lpdjdyMGJpem80?=
 =?utf-8?B?Vng5TWM3UW1iQ08zdGRkWXowMlJwdnV3YlljSGVxUUJaQlZmbWo4c3Ywdm1L?=
 =?utf-8?B?V000TitaRFdEQThmODdHUndqNk5EdDNHSGg3VmdZUVBIMkY5d2NuUG5PRWo2?=
 =?utf-8?B?NHh0MytPSVRZNGxJUGRSZXAzdFVsTXU1Vno1ME9lRlQyN1c2V1Frcys4R014?=
 =?utf-8?B?OXM2S3R2NG9zOHRncGNHYzJsbmM1NllpNjZOY0kzRkhOZE9CNVZsaDkvZFds?=
 =?utf-8?B?SW54OGxFOXY1ckhxTFJ1Y3dKSThNWlhNeGRWQkxBMmhTSVhQUWw2My95dnJk?=
 =?utf-8?B?VGF5emhZR0NxSUVEdkJETU01Tko4VjcyTW9rRzR6TlFJK0dBQTE3TlpaUVYx?=
 =?utf-8?B?WlhWQm5vRFAvVm4xcjRoUXFvUERZRUpYckRNOTZxVjRDQ2hIQlhJQXpseXpl?=
 =?utf-8?B?bWgwT21xYk9SaUJPaVlSUjY5SGliS0NEMjBHSXVQY3JDTG96NG9NejlYSndD?=
 =?utf-8?Q?y9S0gv08R4qqUvWDJXXsPy2xRFuhL7JI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Yy91Tjc2cit5UWt2RHF0dURVd1p0bDRQdmxwTXpBVzhEai83d281MlpQc2JW?=
 =?utf-8?B?eUkxMWExdTZjOVk4UkFxcGN4WkwvOGk0dkVsVTIvb3VVVUJicEsxU3h5eDNR?=
 =?utf-8?B?QU0yOUFlY3dhTlBLOW1yVXQ3ZHY5RlR0TVJnVFZmNEh6RDM5dU1nSHJTb3VY?=
 =?utf-8?B?R2dhQVpzc2h0d3hONW4yQUpOV3cwcU9Ha0wzSTZjVlFuSUZTN25UT3lMT0I4?=
 =?utf-8?B?Uy9iQzVvTDJINjhPNStISTB0em5pTFdtKzNycWlyYmNtWFN2S21ycW1aRi9C?=
 =?utf-8?B?angzSmx1YUFQbzR4Q0xkSElDVmdhS3h5cytOT1cxZWlZeUFVaVpmMVdYZVly?=
 =?utf-8?B?YlpuWWIyYmJCVWdXRlB6cjdDbS9ScFNnQkt6VVhzVVdHUGRpVHV2ZHM4bm0y?=
 =?utf-8?B?Y1g1VGtDQVRFRXA1N01wSnQxSncyRG1DM0ZhWUYwQVJYczdUdm0xYmsvb1dy?=
 =?utf-8?B?VHRva1VJYno1UUF0TTh0Y0NkR25FVGZYV1Bnanl4eXVCSkZwdXlMaVRHb1hv?=
 =?utf-8?B?a2hVMnh3THpKTm5rMmtaQk1MR3YrK09yWU5oamYyS3ZVYkE3SUdNVWFVcjk2?=
 =?utf-8?B?cWh1YU4rMndFcmh5MUMvaWpZRWFxaHVFeW1JRStmSERNbkx0TXlBUXIvS01l?=
 =?utf-8?B?NUFad3ZJWEMrNnd2aHJvcHNFcVdFVlViVm5sbnRRemx1ZWpjbVVtR3BrdENs?=
 =?utf-8?B?TlZnZkp0ZVlMcDd0SWl3dTkrVE9SQjNWdTNNUXU4M1NtY1hLV3grSDJ3Rjhp?=
 =?utf-8?B?VGsxU1JrTENXOVlwYzhUZHBnT3h3dTZtSHFwbHNvMVQ1MTBSYXNvVUFxd25O?=
 =?utf-8?B?d1orZVZ1Z2M1RUgxd3FROWQyVTZjb3d5TGZKckVKUVNyZzRMRVZGVFdTUWIz?=
 =?utf-8?B?SVo5T1BOeDRnVDJDTTVJT0RXdXB0akoyYTJkNVRmSElrMGdLVUtDZFplb2RM?=
 =?utf-8?B?ZmI2MUlYdkVYS0FCQy95THhlczYxY082b3h5YWU1S1VJcUZlNkl2STJvTzE2?=
 =?utf-8?B?REJyUWRleWhVZlIwQzlYdEUwcWU2L2x0cDM5bUxVUmdvZ1dRSXJjdGdPam1F?=
 =?utf-8?B?ZkVxbHNyblFqNzB0MlcwMkQ4TEZOMy9xMTRhck9OQ2k4K2dKQTdwSnVjSVA5?=
 =?utf-8?B?dm5mcFBUM2dhMGk4bHgxaDBEcVVReG5TWW1FSUxDRzF0TlZleGtIa1Qvam1P?=
 =?utf-8?B?VHIvVlBWZmFCa2xUQjlvYmZtSm43OS8vNW8rUmQ0dmxaczIxSDVRVGE1ckRM?=
 =?utf-8?B?cWE0OVJaNFgzeDB1VGRTQWpUeU5ZRzJKTVROTUhFUm5KTGRpLzdFMlJoZWpp?=
 =?utf-8?B?bElYRXNCQ2hjb2YwK29BUmZ4K29zbUl3dmFCYmQzeTcxaGhCRGR6V1NIUmkx?=
 =?utf-8?B?eEhzUHlkSHBPaE5jM09aSFpyUkVmL2lYUTliU25uemJVaU4rajBsTEE3MHFn?=
 =?utf-8?B?T0w0L3FLVm1CbkcvVGJqUFF4WEUzS0N2WWI1M0hFZXk1Q1hhWkJFUGw4K3hU?=
 =?utf-8?B?OVpCTUxzcEFhTzRDVUxMUjVjNEVtSDRQWXlnbktIY1lNdXczeVFKV3E0L1Fa?=
 =?utf-8?B?QnZoc2xJcGVqWVFyNVhrejJmdWg0ZTArWTFrTWVkdTlxWjZrVldWNnpuU3kr?=
 =?utf-8?B?U3V4Y3RjcTBrSnYwVnF5VmcxWE84dUVTWVIrbTlrTkg1NnpYUUtJSDlEN1U5?=
 =?utf-8?B?b0tYSDM1a3JDTXIzNjNYdjRYdU1kVS81ZUU2UmVjK0ttVDN5WTBlUXY1VFhy?=
 =?utf-8?B?aXhvVjNuMUQzTXFaajFtaWxQdkxDM0NhZU9ORjg1RThwSGhMbm4wUjdFQmpn?=
 =?utf-8?B?UEVpSDVLaTZ3UVVxbDNDZ2F1aGR1UmN0TXRMZm43eUxjMHNNN1Y0Qk83WGU1?=
 =?utf-8?B?azNLV1ZGOWZ5K3kwZUZTSENUOG5qcU1DYTFDZTV3SFVxdGxYMzZ3bktRakNq?=
 =?utf-8?B?dkQ2QStydnBTTXFtenM4VXlCamRRZy9NbDRBUEFibmp4Rm9FMTIzVVA5QzVP?=
 =?utf-8?B?VEJTREhITTg0dGVCc1BjNFRVNVJkSk1MZnR5cUM1ZHp5aTRVMnRuN0k4MlRN?=
 =?utf-8?B?ZmhlQk0yY1BZc1VZdk5ZNjFMMUxsT1ZJS0h3V3NFRmlaNys3YmVPRGFaMFFu?=
 =?utf-8?B?aFNPNUxRSTRLZ04vNVlGeXBZMjdQWHdFSVVxSkw0d2hOSHRST0FsMVFpQkFR?=
 =?utf-8?B?WXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d72bc43-03b0-4bee-b90c-08dd348ae41b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 11:02:09.3300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJz7e6YIv+lQeU/Cc08R+gwVzlpr4VDnkSWBni+Ay8Rp4ttPCms2rlLlVv7Hie+0yzP+JJK7sUv9NiV1PV1ePX69ct9xNB4s4nir+KEg6Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9920

SGkgRGF2ZSwNCg0KVGhhbmtzIGZvciB0aGUgaW5zaWdodCBpbnRvIHRoZSBpbXg0MTUgYXJjaGl0
ZWN0dXJlIGFuZCBmb3IgaW1wbGVtZW50aW5nDQp0aGlzIGNvcnJlY3RseS4NCg0KSSd2ZSB0ZXN0
ZWQgdGhlIDQtbGFuZSA4OTEgTWJpdC9zIG1vZGUgKHN1cHBvcnRlZF9tb2Rlc1syXSksIGFuZCB3
aXRoIHRoZQ0KbW9kaWZpY2F0aW9uIGRlc2NyaWJlZCBiZWxvdywgaXQgd29ya2VkIGZpbmUgZm9y
IG1lLg0KDQoNCj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KPiBWb246IERh
dmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+DQo+IEdlc2VuZGV0
OiBEb25uZXJzdGFnLCA5LiBKYW51YXIgMjAyNSAxMjoxNw0KPiBBbjogU2FrYXJpIEFpbHVzIDxz
YWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPjsgTWljaGFlbCBSaWVzY2gNCj4gPE1pY2hhZWwu
Umllc2NoQHdvbGZ2aXNpb24ubmV0PjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+IDxtY2hlaGFi
QGtlcm5lbC5vcmc+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IERhdmUgU3RldmVuc29uDQo+IDxkYXZlLnN0ZXZlbnNvbkBy
YXNwYmVycnlwaS5jb20+DQo+IEJldHJlZmY6IFtQQVRDSCAzLzNdIG1lZGlhOiBpMmM6IGlteDQx
NTogTGluayBmcmVxdWVuY2llcyBhcmUgbm90IGV4Y2x1c2l2ZSB0byBudW0NCj4gbGFuZXMNCj4g
DQo+IFRoZSBsaW5rIGZyZXF1ZW5jaWVzIGFyZSBlcXVhbGx5IHZhbGlkIGluIDIgb3IgNCBsYW5l
IG1vZGVzLCBidXQNCj4gdGhleSBjaGFuZ2UgdGhlIGhtYXhfbWluIHZhbHVlIGZvciB0aGUgbW9k
ZSBhcyB0aGUgTUlQSSBibG9jaw0KPiBoYXMgdG8gaGF2ZSBzdWZmaWNpZW50IHRpbWUgdG8gc2Vu
ZCB0aGUgcGl4ZWwgZGF0YSBmb3IgZWFjaCBsaW5lLg0KPiANCj4gUmVtb3ZlIHRoZSBhc3NvY2lh
dGlvbiB3aXRoIG51bWJlciBvZiBsYW5lcywgYW5kIGFkZCBobWF4X21pbg0KPiBjb25maWd1cmF0
aW9uIGZvciBib3RoIGxhbmUgb3B0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhdmUgU3Rl
dmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9tZWRpYS9pMmMvaW14NDE1LmMgfCA1MyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyks
IDI4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2lt
eDQxNS5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaW14NDE1LmMNCj4gaW5kZXggZTIzYjQxMDI3OTg3
Li4xMDcxOTAwNDE2ZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDQxNS5j
DQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDQxNS5jDQo+IEBAIC00NTIsOSArNDUyLDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXg0MTVfY2xrX3BhcmFtcw0KPiBpbXg0MTVfY2xrX3Bh
cmFtc1tdID0gew0KPiAgCX0sDQo+ICB9Ow0KPiANCj4gLS8qIGFsbC1waXhlbCAyLWxhbmUgNzIw
IE1icHMgMTUuNzQgSHogbW9kZSAqLw0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3Nl
cXVlbmNlIGlteDQxNV9tb2RlXzJfNzIwW10gPSB7DQo+IC0JeyBJTVg0MTVfTEFORU1PREUsIElN
WDQxNV9MQU5FTU9ERV8yIH0sDQo+ICsvKiA3MjAgTWJwcyBDU0kgY29uZmlndXJhdGlvbiAqLw0K
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNlIGlteDQxNV9saW5rcmF0ZV83
MjBtYnBzW10gPSB7DQo+ICAJeyBJTVg0MTVfVENMS1BPU1QsIDB4MDA2RiB9LA0KPiAgCXsgSU1Y
NDE1X1RDTEtQUkVQQVJFLCAweDAwMkYgfSwNCj4gIAl7IElNWDQxNV9UQ0xLVFJBSUwsIDB4MDAy
RiB9LA0KPiBAQCAtNDY2LDkgKzQ2NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19z
ZXF1ZW5jZQ0KPiBpbXg0MTVfbW9kZV8yXzcyMFtdID0gew0KPiAgCXsgSU1YNDE1X1RMUFgsIDB4
MDAyNyB9LA0KPiAgfTsNCj4gDQo+IC0vKiBhbGwtcGl4ZWwgMi1sYW5lIDE0NDAgTWJwcyAzMC4w
MSBIeiBtb2RlICovDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGNjaV9yZWdfc2VxdWVuY2UgaW14
NDE1X21vZGVfMl8xNDQwW10gPSB7DQo+IC0JeyBJTVg0MTVfTEFORU1PREUsIElNWDQxNV9MQU5F
TU9ERV8yIH0sDQo+ICsvKiAxNDQwIE1icHMgQ1NJIGNvbmZpZ3VyYXRpb24gKi8NCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19zZXF1ZW5jZSBpbXg0MTVfbGlua3JhdGVfMTQ0MG1icHNb
XSA9IHsNCj4gIAl7IElNWDQxNV9UQ0xLUE9TVCwgMHgwMDlGIH0sDQo+ICAJeyBJTVg0MTVfVENM
S1BSRVBBUkUsIDB4MDA1NyB9LA0KPiAgCXsgSU1YNDE1X1RDTEtUUkFJTCwgMHgwMDU3IH0sDQo+
IEBAIC00ODAsOSArNDc4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjY2lfcmVnX3NlcXVlbmNl
DQo+IGlteDQxNV9tb2RlXzJfMTQ0MFtdID0gew0KPiAgCXsgSU1YNDE1X1RMUFgsIDB4MDA0RiB9
LA0KPiAgfTsNCj4gDQo+IC0vKiBhbGwtcGl4ZWwgNC1sYW5lIDg5MSBNYnBzIDMwIEh6IG1vZGUg
Ki8NCj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgY2NpX3JlZ19zZXF1ZW5jZSBpbXg0MTVfbW9kZV80
Xzg5MVtdID0gew0KPiAtCXsgSU1YNDE1X0xBTkVNT0RFLCBJTVg0MTVfTEFORU1PREVfNCB9LA0K
PiArLyogODkxIE1icHMgQ1NJIGNvbmZpZ3VyYXRpb24gKi8NCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgY2NpX3JlZ19zZXF1ZW5jZSBpbXg0MTVfbGlua3JhdGVfODkxbWJwc1tdID0gew0KPiAgCXsg
SU1YNDE1X1RDTEtQT1NULCAweDAwN0YgfSwNCj4gIAl7IElNWDQxNV9UQ0xLUFJFUEFSRSwgMHgw
MDM3IH0sDQo+ICAJeyBJTVg0MTVfVENMS1RSQUlMLCAweDAwMzcgfSwNCj4gQEAgLTUwMSw4ICs0
OTgsNyBAQCBzdHJ1Y3QgaW14NDE1X21vZGVfcmVnX2xpc3Qgew0KPiANCj4gIHN0cnVjdCBpbXg0
MTVfbW9kZSB7DQo+ICAJdTY0IGxhbmVfcmF0ZTsNCj4gLQl1MzIgbGFuZXM7DQo+IC0JdTMyIGht
YXhfbWluOw0KPiArCXUzMiBobWF4X21pblsyXTsNCj4gIAlzdHJ1Y3QgaW14NDE1X21vZGVfcmVn
X2xpc3QgcmVnX2xpc3Q7DQo+ICB9Ow0KPiANCj4gQEAgLTUxMCwyOSArNTA2LDI2IEBAIHN0cnVj
dCBpbXg0MTVfbW9kZSB7DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDQxNV9tb2RlIHN1cHBv
cnRlZF9tb2Rlc1tdID0gew0KPiAgCXsNCj4gIAkJLmxhbmVfcmF0ZSA9IDcyMDAwMDAwMCwNCj4g
LQkJLmxhbmVzID0gMiwNCj4gLQkJLmhtYXhfbWluID0gMjAzMiwNCj4gKwkJLmhtYXhfbWluID0g
eyAyMDMyLCAxMDY2IH0sDQoNCjEwMTY/DQoNCj4gIAkJLnJlZ19saXN0ID0gew0KPiAtCQkJLm51
bV9vZl9yZWdzID0gQVJSQVlfU0laRShpbXg0MTVfbW9kZV8yXzcyMCksDQo+IC0JCQkucmVncyA9
IGlteDQxNV9tb2RlXzJfNzIwLA0KPiArCQkJLm51bV9vZl9yZWdzID0gQVJSQVlfU0laRShpbXg0
MTVfbGlua3JhdGVfNzIwbWJwcyksDQo+ICsJCQkucmVncyA9IGlteDQxNV9saW5rcmF0ZV83MjBt
YnBzLA0KPiAgCQl9LA0KPiAgCX0sDQo+ICAJew0KPiAgCQkubGFuZV9yYXRlID0gMTQ0MDAwMDAw
MCwNCj4gLQkJLmxhbmVzID0gMiwNCj4gLQkJLmhtYXhfbWluID0gMTA2NiwNCj4gKwkJLmhtYXhf
bWluID0geyAxMDY2LCA1MzMgfSwNCj4gIAkJLnJlZ19saXN0ID0gew0KPiAtCQkJLm51bV9vZl9y
ZWdzID0gQVJSQVlfU0laRShpbXg0MTVfbW9kZV8yXzE0NDApLA0KPiAtCQkJLnJlZ3MgPSBpbXg0
MTVfbW9kZV8yXzE0NDAsDQo+ICsJCQkubnVtX29mX3JlZ3MgPSBBUlJBWV9TSVpFKGlteDQxNV9s
aW5rcmF0ZV8xNDQwbWJwcyksDQo+ICsJCQkucmVncyA9IGlteDQxNV9saW5rcmF0ZV8xNDQwbWJw
cywNCj4gIAkJfSwNCj4gIAl9LA0KPiAgCXsNCj4gIAkJLmxhbmVfcmF0ZSA9IDg5MTAwMDAwMCwN
Cj4gLQkJLmxhbmVzID0gNCwNCj4gLQkJLmhtYXhfbWluID0gMTEwMCwNCj4gKwkJLmhtYXhfbWlu
ID0geyAxMTAwLCA1NTAgfSwNCg0KVGhlc2UgdmFsdWVzIHJlc3VsdCBpbiBhIGZyYW1lIHJhdGUg
b2YgNjAgSHosIGJ1dCB0aGUgTUlQSSBpbnRlcmZhY2UgY2FuIG9ubHkNCnRyYW5zZmVyIDMwIGZw
cyBhdCA4OTFNYml0L3MuIFNob3VsZG4ndCBpdCBiZSB7IDIyMDAsIDExMDAgfT8NCg0KUmVnYXJk
cywNCkdlcmFsZA0KDQo+ICAJCS5yZWdfbGlzdCA9IHsNCj4gLQkJCS5udW1fb2ZfcmVncyA9IEFS
UkFZX1NJWkUoaW14NDE1X21vZGVfNF84OTEpLA0KPiAtCQkJLnJlZ3MgPSBpbXg0MTVfbW9kZV80
Xzg5MSwNCj4gKwkJCS5udW1fb2ZfcmVncyA9IEFSUkFZX1NJWkUoaW14NDE1X2xpbmtyYXRlXzg5
MW1icHMpLA0KPiArCQkJLnJlZ3MgPSBpbXg0MTVfbGlua3JhdGVfODkxbWJwcywNCj4gIAkJfSwN
Cj4gIAl9LA0KPiAgfTsNCj4gQEAgLTc4Miw3ICs3NzUsOCBAQCBzdGF0aWMgaW50IGlteDQxNV9j
dHJsc19pbml0KHN0cnVjdCBpbXg0MTUgKnNlbnNvcikNCj4gIHsNCj4gIAlzdHJ1Y3QgdjRsMl9m
d25vZGVfZGV2aWNlX3Byb3BlcnRpZXMgcHJvcHM7DQo+ICAJc3RydWN0IHY0bDJfY3RybCAqY3Ry
bDsNCj4gLQl1NjQgbGFuZV9yYXRlID0gc3VwcG9ydGVkX21vZGVzW3NlbnNvci0+Y3VyX21vZGVd
LmxhbmVfcmF0ZTsNCj4gKwljb25zdCBzdHJ1Y3QgaW14NDE1X21vZGUgKmN1cl9tb2RlID0gJnN1
cHBvcnRlZF9tb2Rlc1tzZW5zb3ItDQo+ID5jdXJfbW9kZV07DQo+ICsJdTY0IGxhbmVfcmF0ZSA9
IGN1cl9tb2RlLT5sYW5lX3JhdGU7DQo+ICAJdTMyIGV4cG9zdXJlX21heCA9IElNWDQxNV9QSVhF
TF9BUlJBWV9IRUlHSFQgKw0KPiAgCQkJICAgSU1YNDE1X1BJWEVMX0FSUkFZX1ZCTEFOSyAtDQo+
ICAJCQkgICBJTVg0MTVfRVhQT1NVUkVfT0ZGU0VUOw0KPiBAQCAtODIzLDcgKzgxNyw3IEBAIHN0
YXRpYyBpbnQgaW14NDE1X2N0cmxzX2luaXQoc3RydWN0IGlteDQxNSAqc2Vuc29yKQ0KPiAgCQkJ
ICBJTVg0MTVfQUdBSU5fTUFYLCBJTVg0MTVfQUdBSU5fU1RFUCwNCj4gIAkJCSAgSU1YNDE1X0FH
QUlOX01JTik7DQo+IA0KPiAtCWhibGFua19taW4gPSAoc3VwcG9ydGVkX21vZGVzW3NlbnNvci0+
Y3VyX21vZGVdLmhtYXhfbWluICoNCj4gKwloYmxhbmtfbWluID0gKGN1cl9tb2RlLT5obWF4X21p
bltzZW5zb3ItPm51bV9kYXRhX2xhbmVzID09IDIgPyAwIDoNCj4gMV0gKg0KPiAgCQkgICAgICBJ
TVg0MTVfSE1BWF9NVUxUSVBMSUVSKSAtIElNWDQxNV9QSVhFTF9BUlJBWV9XSURUSDsNCj4gIAlo
YmxhbmtfbWF4ID0gKElNWDQxNV9ITUFYX01BWCAqIElNWDQxNV9ITUFYX01VTFRJUExJRVIpIC0N
Cj4gIAkJICAgICBJTVg0MTVfUElYRUxfQVJSQVlfV0lEVEg7DQo+IEBAIC04ODUsNyArODc5LDEy
IEBAIHN0YXRpYyBpbnQgaW14NDE1X3NldF9tb2RlKHN0cnVjdCBpbXg0MTUgKnNlbnNvciwgaW50
DQo+IG1vZGUpDQo+ICAJCQkgICAgSU1YNDE1X05VTV9DTEtfUEFSQU1fUkVHUywNCj4gIAkJCSAg
ICAmcmV0KTsNCj4gDQo+IC0JcmV0dXJuIDA7DQo+ICsJcmV0ID0gY2NpX3dyaXRlKHNlbnNvci0+
cmVnbWFwLCBJTVg0MTVfTEFORU1PREUsDQo+ICsJCQlzZW5zb3ItPm51bV9kYXRhX2xhbmVzID09
IDIgPyBJTVg0MTVfTEFORU1PREVfMiA6DQo+ICsJCQkJCQkgICAgICBJTVg0MTVfTEFORU1PREVf
NCwNCj4gKwkJCU5VTEwpOw0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+ICBzdGF0
aWMgaW50IGlteDQxNV9zZXR1cChzdHJ1Y3QgaW14NDE1ICpzZW5zb3IsIHN0cnVjdCB2NGwyX3N1
YmRldl9zdGF0ZSAqc3RhdGUpDQo+IEBAIC0xMjk2LDggKzEyOTUsNiBAQCBzdGF0aWMgaW50IGlt
eDQxNV9wYXJzZV9od19jb25maWcoc3RydWN0IGlteDQxNQ0KPiAqc2Vuc29yKQ0KPiAgCQl9DQo+
IA0KPiAgCQlmb3IgKGogPSAwOyBqIDwgQVJSQVlfU0laRShzdXBwb3J0ZWRfbW9kZXMpOyArK2op
IHsNCj4gLQkJCWlmIChzZW5zb3ItPm51bV9kYXRhX2xhbmVzICE9IHN1cHBvcnRlZF9tb2Rlc1tq
XS5sYW5lcykNCj4gLQkJCQljb250aW51ZTsNCj4gIAkJCWlmIChidXNfY2ZnLmxpbmtfZnJlcXVl
bmNpZXNbaV0gKiAyICE9DQo+ICAJCQkgICAgc3VwcG9ydGVkX21vZGVzW2pdLmxhbmVfcmF0ZSkN
Cj4gIAkJCQljb250aW51ZTsNCj4gDQo+IC0tDQo+IDIuMzQuMQ0KPiANCg0K

