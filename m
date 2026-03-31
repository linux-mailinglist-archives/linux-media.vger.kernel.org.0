Return-Path: <linux-media+bounces-57780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D7CLqOny2nJJwYAu9opvQ
	(envelope-from <linux-media+bounces-57780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:53:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F03685D8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82A1F30C0512
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CB03A6B9A;
	Tue, 31 Mar 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BWJbGKQM"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795C39C016
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953942; cv=fail; b=Sj5X2uvNKj38pnn5j0zL4M9T6Zr6RqqyApcjUrAmkEgp5b9KZE1Wvy6nu6HxRXVnMouzWgLyJWTwxkzQMpVK4SNTT6kJNy+tmliZ4RKxc0KPSj0FtHOYtnUnB6cST9gJPPHh95oyrnVYnevGqUeQDRVEOIlryifPtVk+xOeleMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953942; c=relaxed/simple;
	bh=3iSR6sidmqoxK5IABIAoAr4PNNREJ/a9gS5fdMO/P+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UnZEyP1vylIvgCSnEcDwJ8dt/71FHYBgjOO5tDGNeltUu4Eg5d83xtSUEyF77h+8gBpljIFZxmmyZQ41huPwDMq3FM7nrrDBkll5ea0Y5omPvpFdnSnLkO5fqD9daxd8KRT1duL0mLmsN87FML+Z6bR4xCk8Ig+2BWAoXbymUuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BWJbGKQM; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbPrdFXozVWGlObeTycZ+vRrl3IpHp0vXaRwFwS+R8WX/Sq1cjxZ2cRu3CZzU9xQGNTk6KqLGeCRLsilhFnbUnHZDXKp8Ao7VYVdzyPFRBTis85KmVt11c4CB1ZKwe//9/6hLwYVgqYpfJNsn4llULWCpqydv/rCFquF70OaO+BtRre8hkcbqILcR9Gne9Z+OEJgSB+P+lSu/iiyegi+15x5ld0qezfKhyc9ZwsYSr5P3pMK2oKEcUiPyopoJNBKnr9Sm31jPyPcUzMANGDeqHuDvDfh/2FNbUV3f6ey9R7z2egjYyeQHuXgkuQ0nuXCIfVJpAImm0nBMXh9O/p+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sh/d7I35F6rT/Jaswqt5ZM/uzsEDkW4CqEpkEu7Xerg=;
 b=fFZccNVRJgc57VS/49TClE861iH63QatqceKXggmcvv0vO2oZr9yIxLF92Jk8yMNBnyZqPIN2EVWTuRa2IfPzIKOs/vIPr9V4/x/hwz5ZgxFKRoM19R3kb8mI1Xolcaxzv9eWVchmQ+4TYz1NU2WX1Bew7ML1hDh1eUz1yXBpZ7WP5GdwVLlnCR5g45o+dNocrA3ZI+qJuF/7lVRqFDChraRfwpbQHjsCho0mkoCtXx1+KqZJYyZqLOu1nkXIcp6U92NwSPOluKgsWojVN1KlBO8wSRhwCpzTbdjYvEWIb3nn4ilaVawjxaVZ4x2AGcVAvv3Lr6P8k7Rmiyl/s2e1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sh/d7I35F6rT/Jaswqt5ZM/uzsEDkW4CqEpkEu7Xerg=;
 b=BWJbGKQMcIlHGVL/NA7LkGiT7JfndSSCh+SfkUs+thl0jMHdDJCqZVQCbUW6lLDZ4JGi5jK90vnU4jZsfSHauwmHSM4yQ/YHqYMI2m/0NmO2mVMN5QJ/1jiut9W62HX3Anv4oD2tQGtf74/V36+/DpBaDuccCk7nC2EcwOWiBcjCncE356WD4wtFo+XzwSorpYXVJ9YnEYF/jLB+rjG4P7AefjxfE/yUDkFDK1qarfYu9+EcxqDEiDZ0aLUIJsKaXn4D1acfQuIj2RWcmnmQeLwW8HODkQCoOBWt1K68A6JA1KoVmkUgcTvMaWW6W5C7mTTN81bPV+2UcpUKKWC28Q==
Received: from DUZPR01CA0338.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::8) by VI0PR10MB9288.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:2b5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 10:45:34 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::eb) by DUZPR01CA0338.outlook.office365.com
 (2603:10a6:10:4b8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Tue,
 31 Mar 2026 10:45:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 10:45:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 31 Mar
 2026 12:48:30 +0200
Received: from [10.252.25.198] (10.252.25.198) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 31 Mar
 2026 12:45:31 +0200
Message-ID: <3d2b7f90-fe7a-4409-9afb-e41f55410a19@foss.st.com>
Date: Tue, 31 Mar 2026 12:45:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <hans@jjverkuil.nl>,
	<laurent.pinchart@ideasonboard.com>, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, "Sylvain
 Petinot" <sylvain.petinot@foss.st.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng"
	<dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian
 Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
	"Stefan Klug" <stefan.klug@ideasonboard.com>, Mirela Rabulea
	<mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>, Mehdi Djait
	<mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
 <9f56a4ee-150a-44a8-8473-a17931443b30@foss.st.com>
 <acVkqiSPLAWrOv4A@kekkonen.localdomain>
 <51d3cb55-b0d3-4968-9871-b7cc646e731f@foss.st.com>
 <acqivj1Oc-LIDUrm@kekkonen.localdomain> <actrIRy65KweLfS7@zed>
Content-Language: fr
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <actrIRy65KweLfS7@zed>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|VI0PR10MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e50fdde-c066-4b02-1521-08de8f12a308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6tTH4lxoIWq/jsDui21LgrGdUV/GrClqSItrMSykQjlZh4HzwG+ISXESMe0L3my17QABhz7Qk84SCUOL2AqmHSYqPrFQwCapZ3T+UDH9qpDmjX2u2vLNn6fDCGmouMIUNK3nDc2snuEO/5JPq2DU+/XAJzlvyHVyomzdw3XIbXB9ZBdvwsIpvEcp9gQlAWv1cXVk5q8TG9DWXQi9VShblMPw791vX2B/u2J8EjVqBfukVaVPmdnVxPs2N9zWGOmEZR4j+WjBZjjd/M40CzuzAVPGPpgAwfObZCUvMbpL4iDa0zrBZe9JglYSK9CJqGqrIexOjzNNmppBnybS9Fp5AOCUkpDqWXnwm1TeWotENA7olovmJ1yhNurBOJW6/hM0/Nmw74gEL6LPWdJpmDW0dGmApExkNGQQBeR2zXgpNaMYyIVLszrCr/k6Z2rRzF3v+e9SS5JzpJBRiS6QjwQ4Ggm4hMZIPnCzdWopz0SkspX+wRKlm3+t3jInRSKzxOmxc+VGn7BHqp9w7T45dKMCFmf3Z8ZJEGeiJ0RUapEjTPrfh9GYLBIjLxnwbe1ecHXkAkiwCnmKNpjlsi1GUeMlMVX/I6GkS+TKAVVjz4gvawMlwi8zAEtT1+l5sV7wYy/dYZLoUfKprEuy+glL22fG+Pdm3qU+/Q/jwwZmhp97VsFdliwGpTqRXj0kqC4RwKyltilA5D3HoSwMF8/jZbiRq2P6BjjDGmRPXgCCfkBAqXFhLDqAnwfHKbWEOWt5mBwahaYavgqGB5H3qGULCONYdQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2u5MXoEMjFNlQDElBiy3DpOFbvC66r+Es72O33gOi0YbYFIWhHpofGGsijv47OiRVL8QfshcUNp5mX+1K39PqlZJKxO5CbI2ygjOM6dqL4mfvaGtNfF+4gbGCO1fLjG+WFrAnMoYhIQSmof/U4X1pUU0j008iSEgcFnMoRjyntekr4/HVKLwjgaLqlWFmemz5ul6rKNTxaWzVSj6OQrPS0EthNCXRMM1O82PEQw4GIsIFb5VL5AaTSRDpT0bqL5tg9zT2g0LFI97WqM8OxiXX16xX+1H/SX+v4qftDZN4cs2gBS6PqjnzJ59tdoccKWmY6UROrLoaIzT0TBVdDHqmF1qn6CAfT76gpyBxfJsXXCRLggNdLNOIixB+UAbAwMcIA355vMTuMZUya5Sh7UKbUQa5Fhoe3kBUvODM9BCwFiCm5h3YDbyl9u0PodNST3+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:45:34.0096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e50fdde-c066-4b02-1521-08de8f12a308
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9288
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57780-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 012F03685D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo and Sakari,

Le 31/03/2026 à 08:40, Jacopo Mondi a écrit :
> Hello
> 
> On Mon, Mar 30, 2026 at 07:20:14PM +0300, Sakari Ailus wrote:
>> Hi Benjamin,
>>
>> On Mon, Mar 30, 2026 at 05:00:44PM +0200, Benjamin Mugnier wrote:
>>> Hi Sakari
>>>
>>> Le 26/03/2026 à 17:54, Sakari Ailus a écrit :
>>>> Hi Benjamin,
>>>>
>>>> On Thu, Mar 26, 2026 at 05:05:47PM +0100, Benjamin Mugnier wrote:
>>>>> Hi Sakari,
>>>>>
>>>>> I'm so late to the party I'm afraid the door might already be closed :)
>>>>
>>>> The patches aren't merged so it's still possible to change things...
>>>>
>>>>>
>>>>> Le 25/08/2025 à 11:50, Sakari Ailus a écrit :
>>>>>> Sub-sampling is a way to decrease the data rates after the pixel array by
>>>>>> systematically discarding some samples, either vertically or horizontally
>>>>>> or both. Add two controls for the purpose and document them. The
>>>>>> sub-sampling configuration is taken into account in the compose rectangle.
>>>>>>
>>>>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>> ---
>>>>>>  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
>>>>>>  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
>>>>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
>>>>>>  include/uapi/linux/v4l2-controls.h               |  2 ++
>>>>>>  4 files changed, 28 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
>>>>>> index ef1f51862980..b0ad0d778396 100644
>>>>>> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
>>>>>> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
>>>>>> @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
>>>>>>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>>>>>>  independently of the sensor's mounting rotation.
>>>>>>
>>>>>> -Binning
>>>>>> --------
>>>>>> +Binning and sub-sampling
>>>>>> +------------------------
>>>>>>
>>>>>>  Binning has traditionally been configured using :ref:`the compose selection
>>>>>>  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
>>>>>> @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
>>>>>>  also support the compose rectangle, albeit the rectangle may be read-only when
>>>>>>  the control is present.
>>>>>>
>>>>>> -Binning isn't affected by flipping.
>>>>>> +Sub-sampling is often supported as part of a camera sensor's binning
>>>>>> +functionality and performed after the binning operation. Sub-sampling typically
>>>>>> +produces quality-wise worse results than binning. Sub-sampling factors are
>>>>>> +independent horizontally and vertically and they are controlled using two
>>>>>> +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
>>>>>> +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
>>>>>> +sub-sampling, the image size before sub-sampling is horizontally and vertically
>>>>>> +divided by the respective sub-sampling factors. Drivers supporting the control shall
>>>>>> +also reflect the sub-sampling configuration in the compose rectangle.
>>>>>> +
>>>>>> +Binning and sub-sampling aren't affected by flipping.
>>>>>>
>>>>>>  .. _media_using_camera_sensor_drivers_embedded_data:
>>>>>>
>>>>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>>>>>> index 18b484ff5d75..577b73045bee 100644
>>>>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>>>>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>>>>>> @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
>>>>>>
>>>>>>  For instance, a value of ``0x0001000300020003`` indicates binning by 3
>>>>>>  (horizontally) * 3/2 (vertically).
>>>>>> +
>>>>>> +.. _v4l2-cid-camera-sensor-subsampling:
>>>>>> +
>>>>>> +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
>>>>>> +(integer)
>>>>>> +
>>>>>> +    Horizontal and vertical subsampling factors.
>>>>>> +
>>>>>> +    Sub-sampling is used to downscale an image, horizontally and vertically, by
>>>>>> +    discarding a part of the image data. Typically sub-sampling produces lower
>>>>>> +    quality images than binning.
>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>> index 5e1c28850e87..9f8816bfffbe 100644
>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>> @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>>>>>>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
>>>>>>  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
>>>>>> +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
>>>>>> +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
>>>>>
>>>>> I applied this patch in my tree and I'm currently implementing binning
>>>>> and sub-sampling support for the vd55g1. First of all, thank you for
>>>>> your work.
>>>>>
>>>>> The vd55g1 camera sensor only performs sub-sampling in both horizontal
>>>>> and vertical axes at the same time, no decoupling. For now I  modified
>>>>> the patch to have a single control handling sub-sampling as a whole.
>>>>> Maybe there is a more idiomatic way to approach this kind of problem
>>>>> that I might have missed ? Kind of 'linking' controls together if that
>>>>> make sense.
>>>>>
>>>>> I'm unusure if having both sub-sampling axes tied together is common
>>>>> behavior among camera sensors or not. Do you think this is something
>>>>> worth addressing in the serie ?
>>>>
>>>> The reason a single control was added for the purpose was that it does
>>>> allow for implementations that tie horizontal and vertical binning factors.
>>>> I'm not sure which one is more common but both can be supported this way.
>>>> Untied factors typically means having a large number of options though.
>>>>
>>>> In CCS horizontal and vertical binning are related, too.
>>>>
>>>> How many options do you have for each?
>>>>
>>>
>>> I have binning x2 and x4, and subsampling x2, x4, and x8. But I only
>>> care for x2 for both at the moment. You can find more at H.2.53
>>> READOUT_CTRL in the user manual [1].
>>
>> I think I misread your explanation earlier, missing two perhaps impotant
>> letters "d" and "e". Another option would be to implement a third
>> sub-sampling control that would apply to both directions: this is about
>> controlling the sensor only so I don't see this being an issue.
>>
>> Controls are a bit awkward when it comes to direct dependencies.
> 
> Can't a driver that has its vertical/horizontal binning factors
> coupled together use v4l2_ctrl_cluster() on V4L2_CID_SUBSAMPLING_HORIZONTAL
> and V4L2_CID_SUBSAMPLING_VERTICAL ?

Thanks, that's a good advice. I went further and also added binning to
the horizontal sub sampling and vertical sub sampling
v4l2_ctrl_cluster() to see what it would look like. Here is the result
in s_ctrl(), which is still not perfect but already better :

uint8_t binning = 0;
uint8_t subsampling = 1;
[..]
case V4L2_CID_BINNING_FACTORS:
  if (sensor->binning_ctrl->val != sensor->binning_ctrl->cur.val)
    binning = sensor->binning_ctrl->val;
  else if (sensor->subsampling_h_ctrl->val !=
           sensor->subsampling_h_ctrl->cur.val)
    subsampling = sensor->subsampling_h_ctrl->val;
  else if (sensor->subsampling_v_ctrl->val !=
           sensor->subsampling_v_ctrl->cur.val)
    subsampling = sensor->subsampling_h_ctrl->val;
  else
    break;
  sensor->binning_ctrl->cur.val = binning;
  sensor->binning_ctrl->val = binning;
  sensor->subsampling_h_ctrl->cur.val = subsampling;
  sensor->subsampling_h_ctrl->val = subsampling;
  sensor->subsampling_v_ctrl->cur.val = subsampling;
  sensor->subsampling_v_ctrl->val = subsampling;
  break;

As Sakari mentionned I'd advocate for having an additional generic
V4L2_CID_SUBSAMPLING control so I could simplify the code even more. I'm
afraid I'm a bit biased, and tying controls like this seems fine too. I
guess it's a matter of how common it is in the wild.

> 
> Thanks
>    j
> 
>>
>>>
>>> I came up with something like this :
>>>
>>>   case V4L2_CID_BINNING_FACTORS:
>>>     if (ctrl->val != ctrl->cur.val) {
>>>       sensor->subsampling_h_ctrl->cur.val = 1;
>>>       sensor->subsampling_h_ctrl->val = 1;
>>>       sensor->subsampling_v_ctrl->cur.val = 1;
>>>       sensor->subsampling_v_ctrl->val = 1;
>>>     }
>>>     break;
>>>   case V4L2_CID_SUBSAMPLING_HORIZONTAL:
>>>     if (ctrl->val != ctrl->cur.val) {
>>>       sensor->binning_ctrl->cur.val = 0;
>>>       sensor->binning_ctrl->val = 0;
>>>       sensor->subsampling_v_ctrl->cur.val = ctrl->val;
>>>       sensor->subsampling_v_ctrl->val = ctrl->val;
>>>     }
>>>     break;
>>>   case V4L2_CID_SUBSAMPLING_VERTICAL:
>>>     if (ctrl->val != ctrl->cur.val) {
>>>       sensor->binning_ctrl->cur.val = 0;
>>>       sensor->binning_ctrl->val = 0;
>>>       sensor->subsampling_h_ctrl->cur.val = ctrl->val;
>>>       sensor->subsampling_h_ctrl->val = ctrl->val;
>>>     }
>>>     break;
>>>
>>> Allowing to reset the binning if the sub subsampling is set or the other
>>> way around, and tying both sub samplings together.
>>>
>>> I don't find it very elegant but it works. Are we fine with this kind of
>>> code for sensors having these restrictions ? As you may have guessed
>>> they applies for most ST cameras.
>>>
>>>
>>> [1]
>>> https://www.st.com/resource/en/user_manual/um3224-how-to-integrate-and-configure-the-vd55g1-sensor-stmicroelectronics.pdf
>>
>> --
>> Kind regards,
>>
>> Sakari Ailus

-- 
Regards,
Benjamin


