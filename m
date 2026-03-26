Return-Path: <linux-media+bounces-57164-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MCYIRtbxWkk9gQAu9opvQ
	(envelope-from <linux-media+bounces-57164-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:13:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FB338324
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 17:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E45B33020516
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 16:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA114035AB;
	Thu, 26 Mar 2026 16:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="R+Ms+gie"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BC379EFE
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541157; cv=fail; b=Nx1/hDh9gQ+j4lzUK1GErNC/TEWJY5Kcof/hN+s/8QixlvVEzvdqzwuhy7lv65/rtTpLYXCghrqv/DlRe5XgKpNJ+g3OVXcbVqPF6COnjIwzAcXUCfqaGggjUD2qeYITC+AXY9P/T8emmNAyGUvoPUzNf+ktLsMVgCsYMmTN64s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541157; c=relaxed/simple;
	bh=OmLJE+JaougV9SIEjuQxhaOg/iewvZ2FqVRdhCrzlsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JCmS75PDl3rMNEZHRokowSM3QBgbvNfGCTe4vYbnZadCHN8LTOLV9BJVJQc0X4TY//jgSQihiumMXvfOJfvqJtvxRaUxkN8jRWetjKYQSwpHoM7Ai7m3j/MGaRUSLd55OH+v3/WxXiqSgxiRshyF/7UELFdYbcvM4rpcOGMLrzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=R+Ms+gie; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELkTozHUEWByZMU2yAqF/WWZ1gv/GuP+Ux7JXgGeMNbBM6a9oYLPvCNJmGsnkn+YDjO2o1GOwjVhBs117oi3aoyeo5WhyxOkf700xsjSaym8KPRN7jELxawt+VxEOmaQ3mTMvyDNcPy3naphOglkkEW+NLXDkO5ZZzhWeYC7iNBcXB/WXHgqnaTypPruTA5BpzSL4BfUjQFxffE/S4jETitodmd0bmg7Qb9ttCmlLBqamAqUAppqk6uYQI2qmsSYm5LvvWSu5pj80iEexLV8txt3AJeXvPsM4uUMOC6Cp+h6sW2YZsBBgQi8XlwtlvEDhVqA+RDsbas5cc4vudQNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHJLlhUxw48xaG74qVT/+aZwFvaceQ7qnIfi55BMqiQ=;
 b=nQTikEuWWTRJWDAdOwmsvkjdjlwNNjpBjgRNEi68i9vwPUzKmT5SU0dKf78S0nFamwqm0iDB5/xzFWXibXBMpp4j+ac2vYWFpfTw3F2z2YxotmMDslbzTyQr1p+WqAKcLiuSG2zkadGOO2ILc3AzJY1nOltl5VMWibdyCpejdz+qJsT8sfiQF3RnWkNsmmsBV2q+Mi7CWhbLFPUzViDC3DhVeeCrGtZ8DRm2V0oAIAsIiNIPEh+SQiqTt2pF6JPFyCZbJyr9cIvJm/SXFbOpJVSzI+mODaPF3Cq0Leq/8eMINwOfImsAZ2b7NDl9wWvmVZkUhDbyD3NiC15ebN2CeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHJLlhUxw48xaG74qVT/+aZwFvaceQ7qnIfi55BMqiQ=;
 b=R+Ms+gieTuoWAqfGR0nHBw6h9F9v3VvRCEa2VycENiSjPKLcP5x3O086ghfahKMT/rrHZbinMe9S/hDRBA+F7mCYbu2c0wkur34kQPOfF0Y3PRcVT1DFNnGFPcwRwdEhyUNdEwaqt+5NlVMLQBcIJTYst88B3Fchav6Sa9gyQWQFgtAy5ZI/HYOnYQSIRuXaFd17vtMs1RpSRSHP6C5vamNIx3/uPhluSZW268drktCML6XOj0ys91/naaUbQquQTm2WuUiYOT8PuLGOjyO4R48TpcEWzln0dEXwRrseon4B3+qSTdZsLFA42AqUta5k6s2dO+0MI5vOlFDMvK6Cow==
Received: from DUZPR01CA0280.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::26) by AM7PR10MB3796.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:17d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Thu, 26 Mar
 2026 16:05:48 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::6a) by DUZPR01CA0280.outlook.office365.com
 (2603:10a6:10:4b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Thu,
 26 Mar 2026 16:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 16:05:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 17:08:25 +0100
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 17:05:46 +0100
Message-ID: <9f56a4ee-150a-44a8-8473-a17931443b30@foss.st.com>
Date: Thu, 26 Mar 2026 17:05:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 44/66] media: uapi: Add controls for sub-sampling
 configuration
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: <hans@jjverkuil.nl>, <laurent.pinchart@ideasonboard.com>, Prabhakar
	<prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Alexander Shiyan
	<eagle.alexander923@gmail.com>, Dave Stevenson
	<dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>, Sylvain Petinot
	<sylvain.petinot@foss.st.com>, Christophe JAILLET
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
Content-Language: fr
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250825095107.1332313-45-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|AM7PR10MB3796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c56c39f-700d-49e2-a297-08de8b518b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tY82AOLXNMolsS1Ve3pIT3vM2GHf9c/86txg0t98LZ0wof7xKASuEt0u05mF+ouIomQ9DrRla1r0F6CdiXJRBjb8yA5maDo1qLsilIcF0tEnEboU1eoeTGxclH//7IN1zdTWz23BHmgr/lKE4f7VrinIzGy6u+XK3qPoH6Elrr1S/lOPqzwegt9MIjYOAR+rvBxql4OzEiyTQBktJLyoSnLZkAoN74ldTvsgG1E8zzuk9ugj1pgQpGIzyW9T/L2v2sCv8n22KAieMwomkYsB6bL0kPZcobJ/DofFQG6xnosYqmLRvir53AoEx9O/u9Vy0laHTtTdKV7uuabfs5PJZhlC35ZHSpEYcwotS+h7Z+nQvfWUepFfxZjVlMRKfhJK+89s1H2orynsbkmpL6SgE2mhdlHXz3y76fX8oxwBuLbBwLVlqwpoNmtJKOR+NMiXAnIbGHAlbH3gZ7FrF/UR3xnRFZ4w9M1cnG8T0TzFins/Ymsh+0nD7PpAIROEEc8LQQa8dA6qVP9m6D2nYPLGiiBmrU/WvBa7ANVZyeQJwLn5tApCJzeZHTGB0cb1vtIPgYgr/w6OdXJTkfbc+PvOLQw0FVdW73LwHPx4UoX3JBAiasAnT3BdziN0Q9D5WyrnzXnJuRZLUBHmJMHpTAeIM+Ro7OuqF6Giwav/CtZAoIDTZ0jT6+gIjMtekq6lmM9Sr+NomXMTW9YyWG8jty6ZX0G3eIy5Q0LIrW7iPHKJ1DYHhtKTtr52a+WH81xSBF3hr5lBYbeEGo4tJKw3oxF7Ig==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sj+ajBNgs/cFNCF/H1a6U3LcmvqSRiHTsPm3fB43TYESMgPPfAkSpiar9OcTswZ7fQ2qagofjTKNUmrdhRDDaYoEny1Nz3yLsD9dUtg6UMuIz8XPrlWQEePep5BZ2o9mFSIlTpdZWQu089/RCkd0kJafuHUJj7mM4rw0p7VLWJQSL/D4Z9zApOtXZv31Jk4uY4ut4ZHMIcKQoMTVuGFUFYwqQqOEMbDM1/EZC5yTybihrnsMhlGzeyJDq17wqlcOyxgbt+slzicJUXNm1JpqDpe5ANAmsaIvfo0QqLVHm2a6eMxZp51DtHft/LEDg/6VeBIsUBANPp8FWQhExK/ww8NgEcH9wYjtb4Fv6lquneyza2BNqJJCPpFv6S0mvRa5udSgmlu7Tjj8FCA3nzm8YAOsybJ2Y0ouZ4wqFfOA2ejw5sbvePFCTB67qFDuATQA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 16:05:47.6468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c56c39f-700d-49e2-a297-08de8b518b2f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3796
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
	TAGGED_FROM(0.00)[bounces-57164-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,foss.st.com:dkim,foss.st.com:mid];
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
X-Rspamd-Queue-Id: E01FB338324
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

I'm so late to the party I'm afraid the door might already be closed :)

Le 25/08/2025 à 11:50, Sakari Ailus a écrit :
> Sub-sampling is a way to decrease the data rates after the pixel array by
> systematically discarding some samples, either vertically or horizontally
> or both. Add two controls for the purpose and document them. The
> sub-sampling configuration is taken into account in the compose rectangle.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst              | 16 +++++++++++++---
>  .../userspace-api/media/v4l/ext-ctrls-camera.rst | 11 +++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c        |  2 ++
>  include/uapi/linux/v4l2-controls.h               |  2 ++
>  4 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index ef1f51862980..b0ad0d778396 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -120,8 +120,8 @@ values programmed by the register sequences. The default values of these
>  controls shall be 0 (disabled). Especially these controls shall not be inverted,
>  independently of the sensor's mounting rotation.
>  
> -Binning
> --------
> +Binning and sub-sampling
> +------------------------
>  
>  Binning has traditionally been configured using :ref:`the compose selection
>  rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> @@ -130,7 +130,17 @@ users should use it when it's available. Drivers supporting the control shall
>  also support the compose rectangle, albeit the rectangle may be read-only when
>  the control is present.
>  
> -Binning isn't affected by flipping.
> +Sub-sampling is often supported as part of a camera sensor's binning
> +functionality and performed after the binning operation. Sub-sampling typically
> +produces quality-wise worse results than binning. Sub-sampling factors are
> +independent horizontally and vertically and they are controlled using two
> +controls, :ref:`V4L2_CID_SUBSAMPLING_HORIZONTAL and
> +V4L2_CID_SUBSAMPLING_VERTICAL <v4l2-cid-camera-sensor-subsampling>`. In
> +sub-sampling, the image size before sub-sampling is horizontally and vertically
> +divided by the respective sub-sampling factors. Drivers supporting the control shall
> +also reflect the sub-sampling configuration in the compose rectangle.
> +
> +Binning and sub-sampling aren't affected by flipping.
>  
>  .. _media_using_camera_sensor_drivers_embedded_data:
>  
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index 18b484ff5d75..577b73045bee 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -701,3 +701,14 @@ enum v4l2_scene_mode -
>  
>  For instance, a value of ``0x0001000300020003`` indicates binning by 3
>  (horizontally) * 3/2 (vertically).
> +
> +.. _v4l2-cid-camera-sensor-subsampling:
> +
> +``V4L2_CID_SUBSAMPLING_HORIZONTAL`` and ``V4L2_CID_SUBSAMPLING_VERTICAL``
> +(integer)
> +
> +    Horizontal and vertical subsampling factors.
> +
> +    Sub-sampling is used to downscale an image, horizontally and vertically, by
> +    discarding a part of the image data. Typically sub-sampling produces lower
> +    quality images than binning.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 5e1c28850e87..9f8816bfffbe 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1088,6 +1088,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  	case V4L2_CID_HDR_SENSOR_MODE:		return "HDR Sensor Mode";
>  	case V4L2_CID_BINNING_FACTORS:		return "Binning Factors";
> +	case V4L2_CID_SUBSAMPLING_HORIZONTAL:	return "Sub-Sampling Factor, Horizontal";
> +	case V4L2_CID_SUBSAMPLING_VERTICAL:	return "Sub-Sampling Factor, Vertical";

I applied this patch in my tree and I'm currently implementing binning
and sub-sampling support for the vd55g1. First of all, thank you for
your work.

The vd55g1 camera sensor only performs sub-sampling in both horizontal
and vertical axes at the same time, no decoupling. For now I  modified
the patch to have a single control handling sub-sampling as a whole.
Maybe there is a more idiomatic way to approach this kind of problem
that I might have missed ? Kind of 'linking' controls together if that
make sense.

I'm unusure if having both sub-sampling axes tied together is common
behavior among camera sensors or not. Do you think this is something
worth addressing in the serie ?

>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 90f47f4780e5..51d43d4a3151 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1102,6 +1102,8 @@ enum v4l2_auto_focus_range {
>  
>  #define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
>  #define V4L2_CID_BINNING_FACTORS		(V4L2_CID_CAMERA_CLASS_BASE+37)
> +#define V4L2_CID_SUBSAMPLING_HORIZONTAL		(V4L2_CID_CAMERA_CLASS_BASE+38)
> +#define V4L2_CID_SUBSAMPLING_VERTICAL		(V4L2_CID_CAMERA_CLASS_BASE+39)
>  
>  /* FM Modulator class control IDs */
>  

-- 
Regards,
Benjamin


