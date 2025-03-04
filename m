Return-Path: <linux-media+bounces-27457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07295A4DB1B
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 11:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B299188309C
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 10:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA74205E26;
	Tue,  4 Mar 2025 10:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="bbZlLERk"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2080.outbound.protection.outlook.com [40.107.20.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2DF205ADD;
	Tue,  4 Mar 2025 10:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084708; cv=fail; b=m80zjaepwF+k8Um3Sj5G2QMM3kotThLULIYhjye82KbA8Bwpkz6gyDuLBBHcS88QY+3N6br/gPs9dDxktX+Crhrnsp8AwHqxVWx8TC1cGPlR7L/fTj7yCIaTLEOk6OIgqqu7x2mU77X26BEWUKhoJhglLJ2SMAB/L2/qZWXvE4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084708; c=relaxed/simple;
	bh=0PmGEovzkYFCfBS/08bKiQicvLg1DAoPH3g9wPyFo9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h3MZoez26iHM3dCDpAN1jFBXHec8AP3SgKc4asvigQxxsVjSX7NPogsi8zSihiCyZGpfHPyTmsMqRBDLAf7QeLhd8cwYiDyGOaLy518r9/7RM82bzDhnWQid5g8nY3RbWFbLr57CDhlgPPLcNhUaZYsJ+t68htoIsi2P74lGB5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=bbZlLERk; arc=fail smtp.client-ip=40.107.20.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ1z0zeAfPo9pKuV9cNiuNHVO4zWq1N6i/SGuklpSE+FCNJR+33Prww60Ps0QNl+Ix9mdYemjzrFQoffgW2QCUDmopt8dXpjW8ThBb7ZE4J8dm3bYZRU9HHwwwCB2D/jzN1LunrazfpmIC83qNMORhKBVJRzqoWrffCtMNwATl6xB0KlV5EUIaybfYjM4is8bWmkEvaIlXbnCQHKthDFtmP7DrGET7OiRfN3Y3Jay1Vo55xI6LsVTj/Pt+j1Wu8WdnseDscgHruuAop3ZaTvqJoyqDNHpUFjErjFoyzeeoajhoy7PrdwvIBVtMhjm7QnxipfdtWRoXtLGYZLz92uJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPp3Ku4wLLs6Rb7NgpetZ7DFq8Wv/Thv2pmbDvWCLWg=;
 b=kNpZMxvyKZBGsOLfhXwoN0w+PE44GZ4ing0Lrv4PyBnBs0QSx1QCtnnI/W+knY2vn3R4WprnkMUYl17kjTCOXfJC9dalkkjoMLhGZURRrTgxXnT8LeeoUoFDQjYnlUbdDV0waun8zEi9OB/GIgsesFBAh0h/H+NUJn2B9bQW2kuKrUInf8QXGy4QfipsoaZ4FM28QjiMqYmgEPe6CAz1Xgnfa6lYYlK7UcQf8uocprkCXRgVf6k165iHs9Xwat6wloJA7Jev6yKI4HDmUmu09QKjzONOatbsE+U+qMIM70ZIapi2DneHiZFGEUu1UdDZxzj5yWfI2A9C1xDuLzkWZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPp3Ku4wLLs6Rb7NgpetZ7DFq8Wv/Thv2pmbDvWCLWg=;
 b=bbZlLERkkNHR/q1OKLtNoV5uUDMsYLnEmxEHnN+HjQ2WkK68GgQLw+gZRIE/W8n3wDLbX/SpjNP+zx7shzQV7M7GxDb8uju4WyXCV0krBlmDdpl98SFfuUZz25yCVt7EgNl52JeIxRjh+IWq+jEcrUqlf4xOAihB7JeojjLGazKZhjorHGw/44RSeqxtrS1sj5suBHO1Oe+UdOSlRKZs6v6Nvhc/5Ay3m/3paRZ33B5jmi327P4evRh5GNe7WxeBCvhfcVAgZDEGd/iBOjf0M3woKbdXsqvl8tEHiH8Z4hTNzvvnhhL7QG/5515MzpHeojx4yiJF3Jw3wo9exkYpxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15) by AS8PR03MB7383.eurprd03.prod.outlook.com
 (2603:10a6:20b:2ef::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 10:38:24 +0000
Received: from VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd]) by VI0PR03MB10400.eurprd03.prod.outlook.com
 ([fe80::48f6:ae9a:fcdf:b5bd%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:38:24 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com,
	stable@vger.kernel.org
Subject: [PATCH v2 6/7] media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
Date: Tue,  4 Mar 2025 11:36:46 +0100
Message-Id: <20250304103647.34235-7-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304103647.34235-1-mathis.foerst@mt.com>
References: <20250304103647.34235-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::27) To VI0PR03MB10400.eurprd03.prod.outlook.com
 (2603:10a6:800:203::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR03MB10400:EE_|AS8PR03MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e76e75-fa1e-4b7f-3409-08dd5b08b0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Xx5PhBadahZN/1pYynIS3Yq57CmORWCQuN26eH5Hb2VP5FF0SSNM6+DoYQqi?=
 =?us-ascii?Q?V2WfE+SIGiC1ALGFqR6D23a7EErDw/mvE6Z1LUm66JTwjtZxGWP58ceXhBby?=
 =?us-ascii?Q?LQxYeura/7lcolnIA3OtaJBNBcyRN3ekYaHgKi2LH68Ym1ITW3FA5TaI28Ny?=
 =?us-ascii?Q?WhbK208ziSF587wBH54DmuveUEcwSjQZAaYbmK4Fe0BRG3WV7wVMZfG+jorR?=
 =?us-ascii?Q?rIBfPkVUT7C6EMrzeccdl1YOag0dAiPDxjBOdWugyPmnQqjNg1lGekSvNBuR?=
 =?us-ascii?Q?28rEf55xiUSeIZTk/6tLsjXOS2fe1D+Pgfx/gykt57NH+noaNwlO3/STJk2U?=
 =?us-ascii?Q?bNLhk57gVh6Mjy2JY7jvaWqnimjF5wOjp79Cln/RwbgfHMHqPSr976y1G0jU?=
 =?us-ascii?Q?4srv3PGwZKgggKcXWjg5bQY/ZSYafh2J8NLxr44VmqbRgEYCGmN8ruVepq4U?=
 =?us-ascii?Q?QOSpe7pZyoEfOHZ0/2kouwxbZVFODLmGTRWFqE3UlVWLCtJMo3bbYIyHDMeV?=
 =?us-ascii?Q?BDj5dLVhZU50rlcTk21f4GvjkgbelS935NbWMbNdPjIcGPem9TwDofyc81Xh?=
 =?us-ascii?Q?EAb9Jflu+vX0mr51LVf5hPE5eoWBn6NmTrWbCBFV8i/cOWzWoM2I4HPw6ktZ?=
 =?us-ascii?Q?j+PhlRlh4cP47GFAr6X2Hz7/0akmmgNB1hv3M74TYlc8O3KAZdaIWuQXo0PV?=
 =?us-ascii?Q?XpeTAOnNX/L25qMjtd9yti/WdvCRhKBkmhh8xejgbSpVHGPaCZwQ4E7TNI6v?=
 =?us-ascii?Q?eD2OaZ5rH4Nj/81Co6SSfSa6NH6SnK22P9T8j+6THn6l+QqvdtJm9qPm36c8?=
 =?us-ascii?Q?FDml6qCTKjLrXmCCz1gUjveThABy68T7PH7etgq5kL7aKdVK0Z6d5C5r26Hu?=
 =?us-ascii?Q?IFhTKA2huUlr9EktFroYvURN2hv1w+u08YaIHXjzgALl3Pt9MDmRBSHdwY1Y?=
 =?us-ascii?Q?1oFw1WrFsjZJK4hD5m4to85QUprXeh1xZ96qXffC0kzFPeuBlp76MLL//93w?=
 =?us-ascii?Q?6ORqvPmC3qW7IPn+Vk/ha1CkOVJpMRSICSbjJtTI5CnyYJkFvSJ2OpPnZh0K?=
 =?us-ascii?Q?lxjSGsjonu9d/Nc6STlTaGdAL25kX6uDJFZaLf0Saqv/ncVglsT3QK95sQBN?=
 =?us-ascii?Q?pOf+hrVpmiLC0ek5A85lZk4Er5mNR11orNTyF4yz3CSqlDww8w4kvLuV9jB1?=
 =?us-ascii?Q?w02mzAQ3QHzGyHfjIhg5tLcC0XZNbB3nEvss+NeGh45iOl3yvIb3FMps10IP?=
 =?us-ascii?Q?i2Zar3340MKgsORLoOf/6VmtrgqPh79E0c98XwJnxUbH6VON9vKCaIWyIOPD?=
 =?us-ascii?Q?r+3SuHELivR7v1aLVf8bqFenI1DR7JlYqmQqPgpGDsam2alLSyJ7VKZkQmmW?=
 =?us-ascii?Q?yGH+IrpxZw+PwMbjyWS4moTDT9PNDTQ24GqTS9NPb82409j0TAZR1cP3GSJG?=
 =?us-ascii?Q?aqKdr6BU14qUnRDNmAdiKUsUZgkuxmIm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR03MB10400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k7WT5nZM9PadXctMtbKwVfpTtlWagJKb2M1Y4dRDyLveYDypsPMAcVKtssir?=
 =?us-ascii?Q?0dJjfD9v3bPcTKPpioyiF8mJFTKpV9PSNdziBxPu0LXViXLkH6XiQZDJ4sY9?=
 =?us-ascii?Q?5vmVBrLk0lJzjZdohsB5Da4nztTIQDSL+c1d2L3lYUKYIsCezb3Dut4exjDS?=
 =?us-ascii?Q?6+7qJDOMTZ2ctIOaP0X5ZpbJ4pGtV94pYfCHuel4dj82FReHnjSOIU/Ao1P+?=
 =?us-ascii?Q?fXI45GJYDbU7nNqNYd6yOSlSQpoDt0VkORtgI/ir4rfQKzGpSoCfZttqKZX9?=
 =?us-ascii?Q?7p1/25QY4gnzGwtAub97oPEXRRmTXNPKCTymICrzvDUjgnYsf8jdbIVbJ9lZ?=
 =?us-ascii?Q?zy6ouBGfNpRZB+SjH4BYabHtFbYbpiE00taMEIdrFwdG4ZLanMZRoTIlHeBb?=
 =?us-ascii?Q?jh+5NJuuGECJld1EITtI5dJDREFgWC8Xh224sgvUNIL3fAECuEDzXca7cEfO?=
 =?us-ascii?Q?i9suL9IOcZo4nBMiNgD2qhvrFONesjbtPkV9G2psQK3dUwsFx8GK/eXked2n?=
 =?us-ascii?Q?N9P6/gjD1D30RIgmA5FT8prPUJJdVrWZ9rpbKM21ZmDKD2UF/ILeudx+DkUG?=
 =?us-ascii?Q?cOg5tiDnZf0lKcRwgTYR9pVJI+bDVVBA3s0hEALa11pp5RIkoKtp6Dt3+x4l?=
 =?us-ascii?Q?98l0mpURjQmuAFPpHHNUp9MbnfVe7aEJ0OYw0vSCZvy8LEA+g+D10vQ6aUsE?=
 =?us-ascii?Q?0W+csHRsa5iHuRNCJ12MNs+k9DwogCBARjSXB2jYal4Vwpon9PleFitALMVi?=
 =?us-ascii?Q?oPKl3sD2e0O4N4oACeD/9wkEFUWNBzo//axC4AFa+mwhF1GzMX4GyHanDYx7?=
 =?us-ascii?Q?xQBxsss4KOLZJ0HFwpYCQwv+nltegSIRucfbLAvOQDQEEwErQB0DdrllgA12?=
 =?us-ascii?Q?wqNT+ypr0f7u9AJwaqciMdfc+XhfFkw7tFvbXJqFc/ygI/LOiIYVk0fe9SUX?=
 =?us-ascii?Q?N/5327kee0f+yDP9uPv0qYe98wMzvAgPPYFKhJPB7OxIBXuTtoCQ8O5bFwKI?=
 =?us-ascii?Q?eDGQ78Vw5jY7ngehsf8GvAaYkSy8wbivAGHbyzZiM5o0ML04szmBQz9uPGWp?=
 =?us-ascii?Q?3hr+hPmj+9P/wAwUfbb2GDmzlSYZiHl1J6ccpvgWBAt4ZEQhCco2f/W4+YJ/?=
 =?us-ascii?Q?9ealXhNvfVCFqQ/xbvVg8445VGeVNZxRCedA/DAKs9xG410nTwDen7f3+Ifh?=
 =?us-ascii?Q?xuZUeK0f2RHa+z0FmEFC2H0bUieOqQ2N+9tQI4kdUw4HVaEhczszq6YJbqJI?=
 =?us-ascii?Q?8dNSCVfhx6Ll+RgwzL5bHChAKcTCG34NKga8xOhfisCNHxM6Yqc+K2HKE+Fd?=
 =?us-ascii?Q?W5zelF7BbVc5Hxz6uF7jp4Q9W2kWHZI40anAWvKRyE4eWM6nNsFJpW4bqI5n?=
 =?us-ascii?Q?X5v0MHUoiwu1A0Baw2CpvThge+8nOEEEqVZYyYAInJlLGCBy+FgVYXu7ZUrD?=
 =?us-ascii?Q?/epZixsP0TupoiYZHRUiuE3xuY1jQt4bJi2shEVwuTR7Re1/6mG1HR1RmtyR?=
 =?us-ascii?Q?WTx1TaYigeniWvnc8gZ97VR1Os9qDmFYHxCQXckqPnpXrj21XmZhX83McfNN?=
 =?us-ascii?Q?2zbxmaxbip6DdNSt02+yinSAqr3LasTYNR3U7907?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e76e75-fa1e-4b7f-3409-08dd5b08b0d5
X-MS-Exchange-CrossTenant-AuthSource: VI0PR03MB10400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:38:24.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrvawWm3h0R+6fChdENQqxajbDA2+jg2c0lOM9Llbw/me0/xbIibv3KRpK1hzXFEbib3xOB8pnbAec1UlRnmDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7383

Getting / Setting the frame interval using the V4L2 subdev pad ops
get_frame_interval/set_frame_interval causes a deadlock, as the
subdev state is locked in the [1] but also in the driver itself.

In [2] it's described that the caller is responsible to acquire and
release the lock in this case. Therefore, acquiring the lock in the
driver is wrong.

Remove the lock acquisitions/releases from mt9m114_ifp_get_frame_interval()
and mt9m114_ifp_set_frame_interval().

[1] drivers/media/v4l2-core/v4l2-subdev.c - line 1129
[2] Documentation/driver-api/media/v4l2-subdev.rst

Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 18419de6491d..9ab1147a9aaf 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1644,13 +1644,9 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
 	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(sensor->ifp.hdl.lock);
-
 	ival->numerator = 1;
 	ival->denominator = sensor->ifp.frame_rate;
 
-	mutex_unlock(sensor->ifp.hdl.lock);
-
 	return 0;
 }
 
@@ -1669,8 +1665,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	mutex_lock(sensor->ifp.hdl.lock);
-
 	if (ival->numerator != 0 && ival->denominator != 0)
 		sensor->ifp.frame_rate = min_t(unsigned int,
 					       ival->denominator / ival->numerator,
@@ -1684,8 +1678,6 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	if (sensor->streaming)
 		ret = mt9m114_set_frame_rate(sensor);
 
-	mutex_unlock(sensor->ifp.hdl.lock);
-
 	return ret;
 }
 
-- 
2.34.1


