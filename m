Return-Path: <linux-media+bounces-57642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MXKHHWRymlV+AUAu9opvQ
	(envelope-from <linux-media+bounces-57642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:06:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0004E35D735
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 17:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 631F93015111
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559CC333730;
	Mon, 30 Mar 2026 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="egL4rOvF"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E2332EAE
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882867; cv=fail; b=SzS7u4BHcvQw6UwATpkG8HnPLeCg7UAtiCGKTjt+ED8DV0l0HY7tkIaliMtwpddz4o8v3vd/MftDGEqVwp9+kc73U81J7Fk9z33Buu5SttH9b9dB/xEZv6wLx5Ya4aVgrJ/NXBXA8TKomMKMI2JPrIYneO9eRHdOs7RYOowlxko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882867; c=relaxed/simple;
	bh=5uuYIf6TqqojTcCDK5Kk7T2uYvCnxbR3IxSkI6jMeyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iCI4GyxoSslWAB4loIM4JeREHHRgWZegQ5pmdrw0sWNPHtzQ9axOppLdZHnLSYGAc8hDCsgvXyXxOInAyqLEDf6kl4IP4P6VR5KNHmAtIWpHdZLOCtvAq2XsmNeAEo34F7ggdbNTduSvg8fRqMq1y+Jzib2M4mXfXNFcHQ17jZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=egL4rOvF; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnoMb+/RHroqZUmO999dFByhcx4B+sT6qXYYVonJbI//uKSGsVpbidBBfqtxNCBu2tHAlUFuxZjZAlwkrpEHNLm0wmzAC0d/lWHtMZC8enQctaujxK0tJYFQw4RJ40cTYNYTEo5U9Dkh3L+ihmQsH9OnKesmBxoVbHSu9t6EajbkkVkyZd3FoRZWEVHyEEIGwKGbbq7Lq51YGMB/0kC7wBaMc4dX/c5d1C0/gyIQwjwJ3zvqw4WavmlDKI5w7LP9NjCOXdDHX9Vg8N4MF1uniMceDiz4EmnYbRfLmFeP5nM+VuMf0JgoQ3JiP8D/2MHMm31Rmgq6/xNnt6VdQUle6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lf5ORrdA0HPjst6YNyUtPfhMz8YFL6kRMOcourOgciY=;
 b=DYldmvJzTaIhvNql32S38tQkGCbcklxrpgMly9uQvtDLueQroQawzOJ2xkVEH62hsO0JCwyzwEAQJAC/S+BcSDom0Lk/YcVBdo5uHbdUebN4qEmp4Ipjf3wzZK3aZ+YhfgWnttPJpF/WuKwFfVoPQSnkySeiqOYw9TcwFRPaq8yf1nqBooZPFCMLvdjQWiq4543usOFbwme5IGwJQdZZcrlvpJbg6rzEfrMV6IGN+BkdB0M19+eUBZoqRYHlzBedrf0Oq22Hrh7sqxhqPYo2TyadKJvpYYmE0CnmiMej9fW5YwMYItEVUm1QkuUA5W9kiME/GgrciL3F7L4nYEO5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lf5ORrdA0HPjst6YNyUtPfhMz8YFL6kRMOcourOgciY=;
 b=egL4rOvF325LJ8SR2nfjODACmQ2V5HbCTrhpsGL/hhq1J4TS5WwsdKdbT6KhSaa8B8Szrqfm30cgWeL3d7Y8PGuuhz6MzhgLv2tVHJykoz5RFyHmwFnuRmW/PQC1vzexWalUrQvUABJDWSnZkYW48mfzTCjV6WekJu0rJn7/Ih1pYK9ghVfNEPvLPqgDUhknxgadsbSv14zUU4GAw195FbmmUDMTEaC30GpKOqtrfDR3ehNH+Qb8WAjB2mGszHftfEXdy82m/1oE9lPXCpOZSWP3A1wNKgFL4TRU1qDAAiAS3XKiHmRoBLmwUJk2xIDz7mZM31NO5V7JP/LSKN0eCw==
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by DU0PR10MB5656.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:315::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 15:00:50 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::97) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:00:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 30 Mar
 2026 17:03:43 +0200
Received: from [10.252.22.237] (10.252.22.237) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 30 Mar
 2026 17:00:45 +0200
Message-ID: <51d3cb55-b0d3-4968-9871-b7cc646e731f@foss.st.com>
Date: Mon, 30 Mar 2026 17:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
To: Sakari Ailus <sakari.ailus@linux.intel.com>
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
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
 <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
 <9f56a4ee-150a-44a8-8473-a17931443b30@foss.st.com>
 <acVkqiSPLAWrOv4A@kekkonen.localdomain>
Content-Language: fr
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <acVkqiSPLAWrOv4A@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DU0PR10MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f10504-7c83-4890-613b-08de8e6d21d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tHYe65QpKgcSTc6aJ97uuzEebCin0Z+Z2ZtNKfFa5YPvqSJRKEIgfGSbRmPxi945ooZ3D1QaoN01ADCeVMMOEpf0Q43VQXIA57u7WkZG7EOlCRZ/ztlxmr36eTjLsX5lVSYxcK3hcZOJowXmt/A4XFIABNXdmnIPJVLw8fT6/8W/og+lpWyDQ8G3C8Z/q0caWY/wvdBBxjga+hWX9/DWCCIlVTueYtwcbYkYD014Wf0jgviKdhDxnl6lGB3YYnG3Wnq9rPSs1NPENObycK97QaL6kVr24SZ9DLTxRyEd9G6KpOM1lEa2OntGy0L2Qc+rB8yxG7JyofdASJMlx+q01t3oSH3bhcykArusorjjcxKxBl+FVCMPRhBikA/cnsn13dVUVLuCtVT7wUWwc9pMU08GwceffCX9rB0ahkEYwfCeU6osc47dqWho+SIsYvTEt56wnCgXJmMltXBVPXRCw9muooPI2mUaYu79Pz4nZVJmn+kSv6VYHA9piNfPVlxXULNSxHwCL8eMLkmcUT+tgPKrAgzeL8/30VEttpIJw6bo58mtBr8FcRcpnPMZ7A95hgLtAk10duiNYQe6E69v3WPBwuH5ZwDIV4dUp0Cgp+hsd4wQU2wLvItGcHERuaMWMdx7QSLB5SC6wk3GOJ7Nla/CqeyQd2MH+4bBiEaJn/b73yy9xKCWnPxRC7XQAbwpdf0QBD5q9K2JISAm49Ntgh8pHD2E4ug58AXN7aAunRUOJhBSGdH5Ji87DTVYcTn/DY9kOCHBm+3MP4yRoK4euWkVz0uFWc9SjJzlPWs18pU=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H72hxu88uvk6YrrmAs8MAjAEAn2yNHZVMwQPHbTHFY3ZrkXw7rfVsl1qj6RTRKXkfOBKUwItEPy0ZLcxkwwkgkPX5AlPsL9AB15vQq23HcGVYyMxcVX9vRS0zBaxQdF1fiFStuyWzpS6rj5Pt1FUQCTsB8VoiI4AfbTHHLucJtEuR/7CCSkDjyCQYrTmo1T2xVaRo9Uz73fU8hOUdrq3hnRFh6MfRAYSmiCTp7Port2efvmYUq3/0/juR6ksLbOu2r45oAKKd+pd1pXR4xdwg2hCpxHV2REuxJquDU9Ax8/63ZkFvW8xxuZ6hmxx8N9OIK+MZOzXFFAGXMjru9U8Exl6f97Q4JSN8VGEefn7gEZGD68RW9kGEnSxuFsuP/RBV0I2yowbi/DLAUkVU4AO0JomQuWctKptVrZCyZoySNJm5PloUrZwo7t0qv4vq5Lb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:00:50.2937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f10504-7c83-4890-613b-08de8e6d21d9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5656
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57642-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,intel.com:email,foss.st.com:dkim,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.mugnier@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0004E35D735
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

Le 26/03/2026 à 17:54, Sakari Ailus a écrit :
> Hi Benjamin,
> 
> On Thu, Mar 26, 2026 at 05:05:47PM +0100, Benjamin Mugnier wrote:
>> Hi Sakari,
>>
>> I'm so late to the party I'm afraid the door might already be closed :)
> 
> The patches aren't merged so it's still possible to change things...
> 
>>
>> Le 25/08/2025 à 11:50, Sakari Ailus a écrit :
>>> Sub-sampling is a way to decrease the data rates after the pixel array by
>>> systematically discarding some samples, either vertically or horizontally
>>> or both. Add two controls for the purpose and document them. The
>>> sub-sampling configuration is taken into account in the compose rectangle.
>>>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
>>>  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
>>>  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
>>>  include/uapi/linux/v4l2-controls.h               |  2 ++
>>>  4 files changed, 28 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
>>> index ef1f51862980..b0ad0d778396 100644
>>> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
>>> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
>>> @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
>>>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>>>  independently of the sensor's mounting rotation.
>>>  
>>> -Binning
>>> --------
>>> +Binning and sub-sampling
>>> +------------------------
>>>  
>>>  Binning has traditionally been configured using :ref:`the compose selection
>>>  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
>>> @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
>>>  also support the compose rectangle, albeit the rectangle may be read-only when
>>>  the control is present.
>>>  
>>> -Binning isn't affected by flipping.
>>> +Sub-sampling is often supported as part of a camera sensor's binning
>>> +functionality and performed after the binning operation. Sub-sampling typically
>>> +produces quality-wise worse results than binning. Sub-sampling factors are
>>> +independent horizontally and vertically and they are controlled using two
>>> +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
>>> +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
>>> +sub-sampling, the image size before sub-sampling is horizontally and vertically
>>> +divided by the respective sub-sampling factors. Drivers supporting the control shall
>>> +also reflect the sub-sampling configuration in the compose rectangle.
>>> +
>>> +Binning and sub-sampling aren't affected by flipping.
>>>  
>>>  .. _media_using_camera_sensor_drivers_embedded_data:
>>>  
>>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>>> index 18b484ff5d75..577b73045bee 100644
>>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
>>> @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
>>>  
>>>  For instance, a value of ``0x0001000300020003`` indicates binning by 3
>>>  (horizontally) * 3/2 (vertically).
>>> +
>>> +.. _v4l2-cid-camera-sensor-subsampling:
>>> +
>>> +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
>>> +(integer)
>>> +
>>> +    Horizontal and vertical subsampling factors.
>>> +
>>> +    Sub-sampling is used to downscale an image, horizontally and vertically, by
>>> +    discarding a part of the image data. Typically sub-sampling produces lower
>>> +    quality images than binning.
>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> index 5e1c28850e87..9f8816bfffbe 100644
>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>> @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>>>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
>>>  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
>>> +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
>>> +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";
>>
>> I applied this patch in my tree and I'm currently implementing binning
>> and sub-sampling support for the vd55g1. First of all, thank you for
>> your work.
>>
>> The vd55g1 camera sensor only performs sub-sampling in both horizontal
>> and vertical axes at the same time, no decoupling. For now I  modified
>> the patch to have a single control handling sub-sampling as a whole.
>> Maybe there is a more idiomatic way to approach this kind of problem
>> that I might have missed ? Kind of 'linking' controls together if that
>> make sense.
>>
>> I'm unusure if having both sub-sampling axes tied together is common
>> behavior among camera sensors or not. Do you think this is something
>> worth addressing in the serie ?
> 
> The reason a single control was added for the purpose was that it does
> allow for implementations that tie horizontal and vertical binning factors.
> I'm not sure which one is more common but both can be supported this way.
> Untied factors typically means having a large number of options though.
> 
> In CCS horizontal and vertical binning are related, too.
> 
> How many options do you have for each?
> 

I have binning x2 and x4, and subsampling x2, x4, and x8. But I only
care for x2 for both at the moment. You can find more at H.2.53
READOUT_CTRL in the user manual [1].

I came up with something like this :

  case V4L2_CID_BINNING_FACTORS:
    if (ctrl->val != ctrl->cur.val) {
      sensor->subsampling_h_ctrl->cur.val = 1;
      sensor->subsampling_h_ctrl->val = 1;
      sensor->subsampling_v_ctrl->cur.val = 1;
      sensor->subsampling_v_ctrl->val = 1;
    }
    break;
  case V4L2_CID_SUBSAMPLING_HORIZONTAL:
    if (ctrl->val != ctrl->cur.val) {
      sensor->binning_ctrl->cur.val = 0;
      sensor->binning_ctrl->val = 0;
      sensor->subsampling_v_ctrl->cur.val = ctrl->val;
      sensor->subsampling_v_ctrl->val = ctrl->val;
    }
    break;
  case V4L2_CID_SUBSAMPLING_VERTICAL:
    if (ctrl->val != ctrl->cur.val) {
      sensor->binning_ctrl->cur.val = 0;
      sensor->binning_ctrl->val = 0;
      sensor->subsampling_h_ctrl->cur.val = ctrl->val;
      sensor->subsampling_h_ctrl->val = ctrl->val;
    }
    break;

Allowing to reset the binning if the sub subsampling is set or the other
way around, and tying both sub samplings together.

I don't find it very elegant but it works. Are we fine with this kind of
code for sensors having these restrictions ? As you may have guessed
they applies for most ST cameras.


[1]
https://www.st.com/resource/en/user_manual/um3224-how-to-integrate-and-configure-the-vd55g1-sensor-stmicroelectronics.pdf

-- 
Regards,
Benjamin


