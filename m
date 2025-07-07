Return-Path: <linux-media+bounces-37029-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09945AFB6B6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 17:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106683B0780
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 15:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6B12E1741;
	Mon,  7 Jul 2025 15:02:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020135.outbound.protection.outlook.com [52.101.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ECC242D9A;
	Mon,  7 Jul 2025 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751900552; cv=fail; b=gl43BhbCp2vKkG+vTr2SfxNRo5ilqxYTaDSb4vnjpN6wcUsIlkShiirQ3mHnSe31wWRDcc6/C9wFOLsFMBJDmqFwEO6wl4VkSTF5tT51DfTazk34VzASA/9ei5R/Xr9OVEwmDwsl6rNRA92tpADdWMkx6vkWZnMk6miq21Fhd+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751900552; c=relaxed/simple;
	bh=8PqE+7ewz9DrYcDnqsmclkMs6t4JTIn8uKv2V8BSAFo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HQqXB4w9CX3l65g/RdZui8O4kp0M/+aOT3xapaASb+NB51SnUydxxyVtnrb1h2QeULvmYN6kDhvDFvHqR/KCBgVLeohWg3etgV7gBJsk2ZCAOZ2GB5ZnzDCCZWOkAabdvOU/463GkZ4Taf4HM9CJ9xpfDbK2ge1qtnbprLm/6/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTKIWIc96ZG6qFP3a30cKdLBvvQ8to2nBgBsR9hD4eftCvtLSYDYmO6KSlEJ6ISvMJRU3kxETe7tMq4Li8Qm9A5OKUqinO+jftwNtIR1PujIFhsFjQBeD8VsLOgjsxzj7akaYYGURc7z6Onyzxd0u/uaEUW602W4tLeC43Zdua1HonVOWA5Zpz5IIVEh+CJ9Yk0hchLZYw48zZFQ7D0nGORLXimglhXmtrFR37Q7N5kq/8YTBT7fuH+IHLVSSzKhOOLlpMriOnWGgOJr4uggRO6qQ1SLmM3PQ66/KS8ttVMnCPrddDDDAXqyRR9/W9CNsQ3ftZcapBlN0g2wgFYrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su+o0ilx6X7gpKK2C/p/wIHbVXKVpMRVSEALu0EELh4=;
 b=AJl/DL2fa9WWXi3IxvtaosG+EF0qCuT0ZA+b+NVBqhmz+P3Bxd96SUjr1Q5tJDND56Si9X+tKzV4GgIk0tty5ak39IvXbI/hYhBltt2y6qvJ552b4NsivYoKfu8Edwb7kWJB5V20HxN578NCBYqnDKHaEO7oSJ+/WT763b6vij7HarBdhK7PKu3Av8IalEmXJN94sS9I9WYMpsIh9tufw3oi1uB4QsGMpAoXoTnS7ABeZoT996y2A3sGKewZWjKEMbCGhJnM2mLd7A75rgYGJ9gwRO1fo+o9flxAmaWuDgwz9t4DsHmcFF8ToqCO9gAfQ8onv2Heey3llWtuPEK/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB3511.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:144::22)
 by PN0P287MB1222.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:182::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 15:02:26 +0000
Received: from MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 ([fe80::398:38f1:cc91:ece8]) by MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 ([fe80::398:38f1:cc91:ece8%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 15:02:26 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Mon,  7 Jul 2025 20:31:04 +0530
Message-Id: <20250707150118.20536-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::9) To MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:144::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3511:EE_|PN0P287MB1222:EE_
X-MS-Office365-Filtering-Correlation-Id: 62893222-6fb8-42ab-cffc-08ddbd674928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hfre1M85+gTPXb3/9Ccx1SeOZU/aStDa3uZLhy2Je87a6RQXvr++7kChv967?=
 =?us-ascii?Q?xfhQe4V57ImO9nuPl7v4tgn2Xq0ALBb2EAZEovhY72G4Mhu76g/ZZ+1rRHTT?=
 =?us-ascii?Q?g1e+xo3xB5m570fALrGAVDWG3S35VdI8/S2VWQGeW1nBhgCq+5DuAyyRuOyE?=
 =?us-ascii?Q?VKJs0u2NaSBYNNKoJUe5D0yWGqRmWlUCsAJEluICw/xAE0cM/koLTBhXi8Mu?=
 =?us-ascii?Q?JiY1kx0CRFbCKHQWtZ3yar3C8M+zzXqygiXC99gcMf9piDeFTQWs8eyWA441?=
 =?us-ascii?Q?5fLmc8QQMZtwq6BBB00VOrC4CQxM37M3XXwQhbj/aKhb9aN+jKwx728VcIme?=
 =?us-ascii?Q?J0KPJdwube73gwVRJSaSDrSrR5TWo2iqBDQj8nl3EMl58wiHg4kQEckYwTDC?=
 =?us-ascii?Q?gOymF+V8c2Rj5tfGNcyNj9jw1Iin4DliVl6dfhBlpGdcvCf/dMoU1SSkJwZS?=
 =?us-ascii?Q?dx8sWpUBPrk3icr5TfldR00N4Ny5PpYy0U0uNf9nQpJL4MfZsGe0YGktiZGv?=
 =?us-ascii?Q?HKjjUedMcz7eJXBokhG/ZduT9P1lfkncJI1nR2XaypAMdjyHkospByKQ0+p3?=
 =?us-ascii?Q?/4+fG7TuTUulN9n6LX0f8DxtbnJ4Zqu8Q5odRo7YpWGP9A1j435ja7eog86v?=
 =?us-ascii?Q?CN/Lq+GUgOvRdX5rkkv7lWo7kQRpU2bNJ3SHQ8EDa4vYH1qWig9ySjmtUOuu?=
 =?us-ascii?Q?60R5ncPrUVJxx2oOfrB4Pm9KXrawvhIPhur6h5JW1OIVvGbMPNER13fon96B?=
 =?us-ascii?Q?JW0QOf7hJGgZMtH2Wq24uWpEQbMDWFYOqNqTo0el5fgy/Dp6+xohtnaXAEt4?=
 =?us-ascii?Q?2iHp5tJ8qgs2Gk7LaxipcfESwL72mJZrN7xzpTg63VM2RVxfRtKdSYYfDoAA?=
 =?us-ascii?Q?zDOMXgbqDmLkE0BClC4U3ecNc/JtjVf47GKK+DkSpoyldm9gh5aukaHh4G4V?=
 =?us-ascii?Q?PN+VAg9gqOs+UKfipr+7YNpbyYWGB4k5sBBy5qefvVJbUBOQMbpxIDNvzFd3?=
 =?us-ascii?Q?uIsiI8MB97gN3nz1G6GoGOVhPk2f6UTBVclTWgBm4ttY1D5XCRtH6SyGV+K/?=
 =?us-ascii?Q?NrXUs0BQL5w5PW9tm0qfYj/Oi3rLMaZ/O2HL6kOxpWz1TvBan1EQZJxpgZo9?=
 =?us-ascii?Q?4OUFzrlVqLgTPKtZB3kCidsz0i+ICZNt5IDIwHMUzkc0I3HS+VLOZHdjvmyR?=
 =?us-ascii?Q?BTnYH6RQsk86QOuAX552hL95Bw8XdYQYN16yF6LANXZLO+SHZ7bvlENOlmsu?=
 =?us-ascii?Q?n0FVOePhVgk1tBleDWgBnb/Uq4u9SlobfaMnwLNVJjtd+Nl8Kkpft/21D9r5?=
 =?us-ascii?Q?jX4uTkTGihAg5yUHpAHwiKLY0tU+H4aibwAjUNOWzct7HUX5E0T0W8OHPcnh?=
 =?us-ascii?Q?v7dvvmjLocHQvp7gh8uEk9saUTSO4mKtWn7kQyTFgWJ0Q1PuqgHTjhd5fSYV?=
 =?us-ascii?Q?TYTyYVhaYX5jUF7N4aToRyoaxox31TE8dVzHedNAeSKiAt0zESYkXg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3511.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O5tdMAoqM81Zeoolr+KMIRKvK8ZYNBck9vRFjPjgiTAU73IZYg706GBqJpx1?=
 =?us-ascii?Q?gwhNRl9zEJYIgDwrINUN/zba+ksTEs6U4MdbwX0SseUC26jEMlpJcQ2u6IHS?=
 =?us-ascii?Q?AXdDukLJy6kKfFpOTw8FdBFSBqZutfdKLhsC8qX9LePkzUMsicQbtIeotNhu?=
 =?us-ascii?Q?RJCilsFhY+HEGNWGJoPEdkKjkXnkmEOEU7Vye0KeF8GsyOcWdWsUwVvsvoF2?=
 =?us-ascii?Q?Vk+93I4u4mPcG84iz+TdAWC4JplPzGilVL9dxj70QynTLlC78vIEy5b+0teh?=
 =?us-ascii?Q?81VF5AzX4moR1LTDdW/PC1jkKOrM0ekYMKkUBWL2cw54wXuX8BmlkWxb2U3Q?=
 =?us-ascii?Q?+O+FTrs3Mud6ZvQuwzqxpKTq4XK9HgmKMR+spvDQMS9q8G1yNbln07K24qeH?=
 =?us-ascii?Q?O0thKtdIo+f7EFeRFXGy3wQ1mflJAdKIyaEihU/hbf4mqQI916K52AoS14yq?=
 =?us-ascii?Q?c0QdZAx3QkYzk5NpiNTq6+edRsdcZdVJKhUWj1z5QaJRRly3j0xztFxLaxps?=
 =?us-ascii?Q?bI62xvB120PRdc7MSCgChK4bsuRYTnmclVx25CDwAeBl83EBfd73+0T27KBQ?=
 =?us-ascii?Q?dnYFiVH3XpIRFzi1RAJEkPBielgVDgiEHRYmDA1PrvprSg7K9eWm8wvUJTAL?=
 =?us-ascii?Q?pG4SkkhLzuw6Up6Oov0UqgL13nmG78VTt1I/2UAhjHk9nMLUBGh4cdzqKdZJ?=
 =?us-ascii?Q?X+ICV1B941SUbAz60bfDr3E1Q9WLGCoyng+rYx40LjlTS/aB/yFKFMjp6nb9?=
 =?us-ascii?Q?y2SJ+/JaJYGyXBC6dUVmXM4lcLs5lLWUL93WsHaF/XogSoW9siQUioIsXSQP?=
 =?us-ascii?Q?dzNj++AciHPiw812HIjCMg7WnbgSvzBS9wvZSgT2UJjeHVQWKJFDr/eU6DwN?=
 =?us-ascii?Q?VuLI5J6tqw3haWWfEFCcfY1vh9izDEdVOn36trJYgrmFMOubNG0wOpqa3gax?=
 =?us-ascii?Q?HoR1WT2OHiDz9ERSOoq0cnrPoKlzDHg1UrQK4HqwAA7oDIFPKHUM4BcwOMQu?=
 =?us-ascii?Q?P5EanIkN44UmxZdpt6fJXgEneYyaTcBbVuCOgXcGlb3qOT/kQemnzAzdFVAn?=
 =?us-ascii?Q?Q5LDWv1BSa9dIbYABozDhRo5MAEJHK3QHhdLGjvF9b6KKUSql3eVSzrTyNYn?=
 =?us-ascii?Q?u/eldOlK/8ejApccAgA/IoU52leQ2sknvb7xwrKpHD84uk0TNqZtocskYXMv?=
 =?us-ascii?Q?Ig7iAm4gA5AXyIBCAQwYgIV0S3mXnVfZ6MkCmqELURrz/1kmKOkk7Oh+dOG1?=
 =?us-ascii?Q?cnkLgqxwB+MshI0TZza1cI/RXopM1sHj1NdgNF1SEaYN5vxKVuoURqpkAfU0?=
 =?us-ascii?Q?b4GZbrxqEGtPAdNf4nmWHXJ6koTWZb1LHjLkq/x+IfldPKoJgRQDMNrR9XBo?=
 =?us-ascii?Q?Ikup3XIBkzI3kxQ5e3rnhlLsdmzaNjj1OPvESqb268CTtdY+udNBKI9lXdhq?=
 =?us-ascii?Q?kHb+CxAm6n/sgiBFYfdLWJ597oOAtDb95ARhNOkqs1SQQK0vNvlFHgSM6Z05?=
 =?us-ascii?Q?rIYLQWEql3zUjrD2JE/LRSa9hWixv0ull++poovuOWMrBjN6f4oxUzF7bEj4?=
 =?us-ascii?Q?ls1daO9ViMcYr7inVF8ukxPPxoxRNYqWJHWhA6ML/jGET+OAUGGSXoiWZyZ5?=
 =?us-ascii?Q?BRArdcTBdZsTpNFTjW/70eI=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 62893222-6fb8-42ab-cffc-08ddbd674928
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3511.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 15:02:26.4219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SLszOPsqt8zkEmLHlIuL6LLhyWB8KDOqmEUZh4oeNevXoEikVck1YxriylWvTln4cWsfhmoAVYmPLtiB7AqV4dUsiVvx9diJaz9UUp83G4NGKkX9ut56B4vcYEaQ9B6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1222

Add a v4l2 subdevice driver for the Omnivision OV2735 sensor.

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an
active array size of 1920 x 1080.

The following features are supported:
- Manual exposure an gain control support
- vblank/hblank control support
- Test pattern support control
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10)

The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

Hardevsinh Palaniya (2):
  dt-bindings: media: i2c: Add ov2735 sensor
  media: i2c: add ov2735 image sensor driver

 .../bindings/media/i2c/ovti,ov2735.yaml       | 104 ++
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/ov2735.c                    | 907 ++++++++++++++++++
 4 files changed, 1022 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


