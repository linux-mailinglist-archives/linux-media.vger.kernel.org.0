Return-Path: <linux-media+bounces-41318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB14B3B6BC
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 11:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CEB27C7981
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75212F49F3;
	Fri, 29 Aug 2025 09:10:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020098.outbound.protection.outlook.com [52.101.227.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B89C2727EA;
	Fri, 29 Aug 2025 09:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458636; cv=fail; b=Zm3twpRDlHBTLFIhOQEYJzAJG3zThaLtRalCE7PX/C0GkpL7jGcJW+BLpN0EFuJp22cN/7pnOnzL2alYboljGulpK3+JhSoCddS3Jna2mY2LuRHbt47ntnAtKwgwgudvdFOmCTQFU/sEGiHl8VQfz760/3LdEv5eyKl0I8gyj4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458636; c=relaxed/simple;
	bh=D+pWcw/L1ul7ix7lQbgFNbqrGnJKAsvjGrrTJ47QwHo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jUAb/EjAn6PYrVG5PgCQHCI2kjIHn3j6L/dRabUVqNdWYEYJq3OOAHbR4vXB+hMkbQa7yL9oooGiL4iC1q4mclRFjUrWK2hCquV3jflO+VFLXntjb5Og0gsl3RIcubkKxN3n/k7jFnsyGOh5JpCL2ekVux0P83/I2eW43JZ6MtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdQScyio4hkAgm2p1Gz4uJp8bxZGateNjXZqnjaiVKlHJThjyUpxFBXB7WU5Ud+PPLJK8ZAFivYIU0ZRtLNrrKFJ5J9BzlQq60aUEXoNQoxLJ2scVFK3jXF2kfFW02Y0y3w78Z/tGkHykeycsGKLHDxFCrQRX9CQaKrxHbDNndEVHpFsYEOU2V4ZNLCaoKfwwqpQIvIr4jOFWsQLhSkYh4RP++f5qzdJ9FPZU051jjTkchQcZ3duQZrtEQZwqA+R4WFJASHnOvLj4qMz40S/2233hLW9uzsQp7ozExjmvtmKVinSkYcHlk5y3JqQNI+f5w8yYqKyGtORtkTfewT3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PO4+5Sur2OKzGHZFmI2T9rECwY9ZIvflDm5h/BYft8=;
 b=QLfVoN9AhjK5Q9TFNtdcl1l076B2wm9nO3jifU/gmYJcicpknvbvW33dyP7GUHv57swWdimAwgOytC7STEnZBkrtfhq5/ql+yRhaBxGWZgjszbotk8Deug54GRRszY0lYPxps25l1LK+Ct9zHnKSFht9SofIUD2nw3cE5DgYITUJb/XYdvsl+1HLcdmnHqAiBy1laMtIYB4xBLQIv3YGBMi542SPfCTkyilAmbGHCftGz6CA21XajCOuBuy6jpyc7GtaHecSdaL4qFiBkrEEA91ZuFy6LwwxFQicx4yDSpesYS5b7rVxZZyOtE/vpIVELvjoSOheQi6QLWcXO6DfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by MA0P287MB0801.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Fri, 29 Aug
 2025 09:10:29 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 09:10:29 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Silicon-Signals <siliconsignalsforgit@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Hans de Goede <hansg@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Fri, 29 Aug 2025 14:39:49 +0530
Message-Id: <20250829090959.82966-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::15) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|MA0P287MB0801:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e021123-cd62-4318-c11b-08dde6dbe647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+M/2JxGO9//bh+nMyNA2dFK7YZpmM28+8+GEuG57qiOLURH58r//umoQ4ILS?=
 =?us-ascii?Q?grSuG1WQGiP8BBdyUEV4iIFp9j5S5YM57tZH0s0CW7dxrHRLos4mSrE2xXV/?=
 =?us-ascii?Q?RFNCrLb/kXPaNt1ZUZLMeMjCLx/wxke9vWf9+GZa2jwgOfKobB3LEOPwDzyH?=
 =?us-ascii?Q?QOandYhmafAGfeiJwWLHRcjsFXq0q+Pmo/xBmBTixGxURqw6Ps5W/97TioLV?=
 =?us-ascii?Q?S1sHzd6lREB/6V5z6zw5KUXxElat/g+r6QSMO/wVkWglKAu/nDPK6j3I9vSI?=
 =?us-ascii?Q?FfQKak9hMxmv0wWlM/eIcjq+lWbFtqNdqfDqDBNrM88TqVV5IxBawGHOuUjW?=
 =?us-ascii?Q?8nFiEAUDobejUl2T73ik+kwmnaU9tokWMZAiNYs8rHdrtXnFoWfGWNBmlIha?=
 =?us-ascii?Q?N1mJCDO2ozUzeMvEUt7I5U4qz8m3tbi68B/pK50GP6a5+bcvGnR+f7bTVhPm?=
 =?us-ascii?Q?BcepiE5P610T5BZmybHE1tIclsMfhEjWTJu6cS1x7iBxEWLozRoqyuP4WYJy?=
 =?us-ascii?Q?i5682tTBFjJY1Hnn7aCLBb0RV7vlXY4LfTgvcAL1LVXK1PUhviWi0aq+spID?=
 =?us-ascii?Q?ohZu1tm3vNc+k5X9sAvx5Y7imXIoXpWmaYIYD78PcNC253MXMdTTaFhCpSle?=
 =?us-ascii?Q?vASrc63k8KsCPsLMEZk3CmHyLLhIhje+ZEZBIMvFfpKVCd5AyiSYKiocWfgn?=
 =?us-ascii?Q?U+GaIGRDzeSYg8+U4okWr9KOvx2U5Gm7D1aOqUrqkB8p8xygrPBuIvNbH3Xr?=
 =?us-ascii?Q?jQe+Zn2YMgz6Bi01DEql5VFzOdhm+PXhLhVPpUm+EwHrwQ58OcMMYpZXIFWO?=
 =?us-ascii?Q?NN+3UP/fo6rnzyhVJfAmbDoYZYjP2XcuyD5d8znflMEVgMYIYMqC0pXkKZhT?=
 =?us-ascii?Q?VUV953VE1w+bDEMzgme8xXzZ6ut0Le6Ol+4+ziiKifw1bLv6kryQM3LmUbBM?=
 =?us-ascii?Q?fk4Ug8YNLHf3fQ3DkpP3u8e15kDIxvbpqpQVqfHTD1oOHd+kI/lgfXxUK5rM?=
 =?us-ascii?Q?Wv1PEpZloVPEWd0IjcCrNt21xD1KirK1ykTMYB0gyKKZUAHcPskVk2RHjLqZ?=
 =?us-ascii?Q?sKzoqqXGxHuBS5gNzvEmTkxWh+/KRTuNhsR7AgOyRGGdp4ExVCZBDbYs0dII?=
 =?us-ascii?Q?dmvclAFPe6kjgeb29gFr9SnnIgoSvzAuRINuCDZo2yzYn5ROI02dKsdKJcSR?=
 =?us-ascii?Q?k1AYIV2Bnuvb4sksE72rE99zgls09FkSl27gcpB07ZI/w+6r9qebDXpxd9Vx?=
 =?us-ascii?Q?tFY2g4K2UZU3DfLOFzq5JkqF9HVmB2pTyFS11tB5KsnJlG6aAhgNpRst9NM8?=
 =?us-ascii?Q?M4Wjw8+OOtnaucbo0Usmo0YwiprNDwefNtXzGl5vFg8BDXf16ZzeNJ2Q4ZQX?=
 =?us-ascii?Q?gRGXCYddBQAMoZWyvNux6rG/hw2mKoK2Ztdk5BiR1JoSCnCGjJqh0VGia07h?=
 =?us-ascii?Q?zMqbXkMDYOOpwgwrd1ujOFt9umuD8LzpivmAQhoaMu/0DhQ8F7r2WQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8mcULNbwBLwA8ne4cQvD8If/gMH81lbT4WpgWnbz4/OdMt68ewiKa3/BNn38?=
 =?us-ascii?Q?6U81FOGGMSiMtYJTIJH5aScz6lJI/+Bi5ByHyT8A+r6jcv4j/fMQGcazmzY7?=
 =?us-ascii?Q?tDUrZKPzjO8bOGh0bGl3RGbOg4S8kk2YLXHNQQTEycpw+HnumZccA+7TxFUH?=
 =?us-ascii?Q?3upUuy4kyTtjXAl3lw+wMvojEvAL/F67Tg7wWKjDIITUekTsUPZl7OqgLpfC?=
 =?us-ascii?Q?Cm0Ld38RW82EE3SezfZ3cELwJnFHj5m9GeDuF53m0bbJ/vx8SPCx6UuRdzLl?=
 =?us-ascii?Q?VzFyEOw9TELVVJd5A94PjPUM2RVSZQ3YKtuA/QqVcXdVsJSkn5EUiYySFAqY?=
 =?us-ascii?Q?mXz0qfwl4F8T9VRrTOy61LOMlOLGWC2LTgLUk6lo0dAcnB7KNkMVbhWwPoq3?=
 =?us-ascii?Q?hiXhfLhU1jvhfMLyzPMYXXXuwt9EgYnjaAF8QAb/jBtYcVrTl8cyDJ+715vj?=
 =?us-ascii?Q?j3J/VQ/jHHoNo6OlAjJqjC1ibFBdcdktMnZ0dpn7GqhlL5xU0daroD/em1Xu?=
 =?us-ascii?Q?RnHzPqUoF0CcySB84ozFivu0TI7GYSM4BRRI+RHFp967oVqbvSVBlHYJ1hz3?=
 =?us-ascii?Q?MkjXBKWpTbXqsXb2pdndNimQUG0QonNsng9VT5/YRjNvWfe132boVngVIagN?=
 =?us-ascii?Q?XTX+uxU62umzVZfESeoj5MBPF+MkeZoZjyaI6nIV5Y+hqG1lOkGKJCgY2te1?=
 =?us-ascii?Q?FXI9Ld8NY/G6UUTwg6Tjtl4OWzxrb0p1wiYUoT+5S9/JbJ43glvtlSuSUNWW?=
 =?us-ascii?Q?jnWLSKK6MsMSQ/XhYbGW/Bs7j7VWvft4e1c77cMqPAACf36rdU3xqucmJdjY?=
 =?us-ascii?Q?slN6XR4mbcHza1ZdH0MxSyfNXHrx4jyxBbUQIqzNmplU0ZMCl3CEcFR6cLYl?=
 =?us-ascii?Q?HjjvTSeTv/Tniee6toeoRPjvVkMu+rNnxh8dbEoeM8lCBZvnbICB47rqwv/D?=
 =?us-ascii?Q?oQwX79/h0wTEmHLNpKo2KV5W1yd0zxQZk+PMWX8kZf2w2fkYHeSRjwVN/VNc?=
 =?us-ascii?Q?T4O8MTJTpz5a2LaZa3ChRzppUx3hzoTBZ6EeiTbLBdWg7sbKNx3BxUWogwSJ?=
 =?us-ascii?Q?7A7fDb/8YsJGLxvO/M761DXax7R4RpWjORfkIOVyL740uqR3quoaFiraGTpO?=
 =?us-ascii?Q?6GHcL8bFBlO/B4V3orNuPqveQY0b/bBHeiK2VN1i52k7narEjZnGZOrADQUI?=
 =?us-ascii?Q?2GGVv2zZR5Rtt8378Vw3EO4WJSMD0gClX7AM7bJeA6qrLSvjl/iLTV5KziEu?=
 =?us-ascii?Q?ULGMguZnI4+65WQiurxvE9deug7Oo4nq7Z0Yc3wK0ysCZrtrui8DNOWqzSMp?=
 =?us-ascii?Q?9rJk3ytIxBeqcD64Kb9Eh+5kbalTSY9QDUNEagwXOVcTiUxnL25Uk5BfS32g?=
 =?us-ascii?Q?yMvx+KPV7iU+Qo7pIvzyp3gWQvrDcb+suxUe3/UrsG9LsWgcgqD9hfMEceaD?=
 =?us-ascii?Q?C3M6vDjVFnlG/ttEoZOsCdqr5kalpSYjgjG3PHK0ohyXGYCmesAinoCJuf+1?=
 =?us-ascii?Q?mWi7+/8ufEcRQ1tB6TzrNhuYRdsmRpnxfN5cf8KdJ08ZXHElIIBA8NgqAqwC?=
 =?us-ascii?Q?o+hlV09L3JY1q1Gaf7lZXvfH8T8y8opg04Ez7kJSqyv2R4e58hJDqdj0rhtl?=
 =?us-ascii?Q?+tJNVRGyuPlvyj0VSrE/jJY=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e021123-cd62-4318-c11b-08dde6dbe647
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 09:10:29.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ao4hhFgB3IbO7X9lX8PbuiZufZQfJ85ngdOImQgUtcQSU4Ohkp3qm4BjTUOBLcVlMTMyjPF3Xnk1Ghga82V4Yncj4DeP1owNLyBt5N9oSeiYPDDDIMmB1+12UbBnF5hL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0801

From: Silicon-Signals <siliconsignalsforgit@gmail.com>

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an           
active array size of 1920 x 1080.                                         
                                                                          
The following features are supported:                                     
- Manual exposure an gain control support.                                
- vblank/hblank control support.                                          
- Test pattern support control.                                           
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).                    
                                                                          
The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.

v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t
v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22

Compliance test for rkisp1 device /dev/video0:

Driver Info:
        Driver name      : rkisp1
        Card type        : rkisp1
        Bus info         : platform:rkisp1
        Driver version   : 6.14.0
        Capabilities     : 0xa4201000
                Video Capture Multiplanar
                I/O MC
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x24201000
                Video Capture Multiplanar
                I/O MC
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : rkisp1
        Model            : rkisp1
        Serial           : 
        Bus info         : platform:rkisp1
        Media version    : 6.14.0
        Hardware revision: 0x0000000e (14)
        Driver version   : 6.14.0
Interface Info:
        ID               : 0x0300000b
        Type             : V4L Video
Entity Info:
        ID               : 0x00000009 (9)
        Name             : rkisp1_mainpath
        Function         : V4L2 I/O
        Pad 0x0100000a   : 0: Sink
          Link 0x02000017: from remote pad 0x1000008 of entity 'rkisp1_resizer_mainpath' (Video Scaler): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for rkisp1 device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0

Media controller API version 6.14.0

Media device information
------------------------
driver          rkisp1
model           rkisp1
serial          
bus info        platform:rkisp1
hw revision     0xe
driver version  6.14.0

Device topology
- entity 1: rkisp1_isp (4 pads, 4 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SGRBG10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                <- "csis-32e40000.csi":1 [ENABLED]
        pad1: SINK
                [stream:0 fmt:unknown/0x0 field:none]
                <- "rkisp1_params":0 [ENABLED,IMMUTABLE]
        pad2: SOURCE
                [stream:0 fmt:YUYV8_2X8/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                -> "rkisp1_resizer_mainpath":0 [ENABLED]
        pad3: SOURCE
                [stream:0 fmt:unknown/0x0 field:none]
                -> "rkisp1_stats":0 [ENABLED,IMMUTABLE]

- entity 6: rkisp1_resizer_mainpath (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:YUYV8_2X8/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:lim-range
                 crop.bounds:(0,0)/1920x1080
                 crop:(0,0)/1920x1080]
                <- "rkisp1_isp":2 [ENABLED]
        pad1: SOURCE,MUST_CONNECT
                [stream:0 fmt:YUYV8_2X8/800x600 field:none colorspace:raw xfer:none ycbcr:601 quantization:lim-range]
                -> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]

- entity 9: rkisp1_mainpath (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: SINK
                <- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]

- entity 13: rkisp1_stats (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
        pad0: SINK
                <- "rkisp1_isp":3 [ENABLED,IMMUTABLE]

- entity 17: rkisp1_params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
        pad0: SOURCE
                -> "rkisp1_isp":1 [ENABLED,IMMUTABLE]

- entity 29: csis-32e40000.csi (2 pads, 2 links, 0 routes)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev2
        pad0: SINK,MUST_CONNECT
                [stream:0 fmt:SGRBG10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                <- "ov2735 1-003c":0 [ENABLED]
        pad1: SOURCE,MUST_CONNECT
                [stream:0 fmt:SGRBG10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
                -> "rkisp1_isp":0 [ENABLED]

- entity 34: ov2735 1-003c (1 pad, 1 link, 0 routes)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev3
        pad0: SOURCE
                [stream:0 fmt:SGRBG10_1X10/1920x1080 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range
                 crop.bounds:(8,8)/1920x1080
                 crop:(8,8)/1920x1080]
                -> "csis-32e40000.csi":0 [ENABLED]

v8 -> v9:

In Patch 1/2:
- Dropped tree reference

v7 -> v8                                                                        
                                                                                
In Patch 2/2:                                                                   
- Correct some macro prefixes                                                   
- Add register names for timing and analog control registers                    
- Make the common register array const                                          
- Wrap lines within 80 columns                                                  
- Remove unnecessary guard delay                                                
                                                                                
v6 -> v7                                                                        
                                                                                
In Patch 1/2:                                                                   
- Remove 'link-frequencies' property (already present)                          
                                                                                
In Patch 2/2:                                                                   
- Add mutex guard                                                               
- Correct pll_ctrl_enable macro name                                            
- Add error check for '__v4l2_ctrl_modify_range'                                
- Remove unnecessary comments                                                   
                                                                                
v5 -> v6                                                                        
                                                                                
In Patch 1/2:                                                                   
- Add MAINTAINERS entry                                                         
                                                                                
In Patch 2/2:                                                                   
- Add Required headers                                                          
- Change ov2735_page_access prototype to remove casting                         
- Add error check for devm_pm_runtime*                                          
- Remove unused variable from stream_enable (Media CI robot detected)           
                                                                                
v4 -> v5                                                                        
                                                                                
In Patch 1/2:                                                                   
- Add Krzysztof's Review tag.                                                   
                                                                                
In Patch 2/2:                                                                   
- Remove redundant if (ret && err) check in ov2735_page_access()                
- Address coding style issues (indentation, format specifier, combined declaration
- Replace hardcoded values with USEC_PER_MSEC where appropriate                 
- removing unused "ov2735->client = client"                                     
                                                                                
v3 -> v4                                                                        
                                                                                
In Patch 1/2:                                                                   
- Removed the clock-names property from the device tree binding.                
- Added link-frequencies property to the port node.                             
- Cleaned up the example by removing unnecessary entries.                       
                                                                                
In Patch 2/2:                                                                   
- Removed the cci_ prefix from read/write functions and custom page macros.     
- Corrected error handling in the ov2735_page_access() function.                
- Calculated PLL parameters dynamically based on the specified link frequency.  
- Set resolution registers from format and crop instead of hardcoding.          
- Fixed a memory leak in ov2735_parse_endpoint().                               
- Switched to devm_pm_runtime_*() functions for runtime PM handling.            
- Added documentation for the use of msleep() in the power_on() function.       
- Corrected GPIO polarity handling in the power_off() function.                 
                                                                                
v2 -> v3                                                                        
                                                                                
In Patch 1/2:                                                                   
- Renamed pwdn pin to enable pin.                                               
- Changed supply names to lowercase and added them to required properties.      
                                                                                
In Patch 2/2:                                                                   
- Stored page number in CCI private bits.                                       
- Added helper functions to handle page switching in cci_read() and cci_write().
- Removed ov2735_mbus_codes.                                                    
- Corrected control count to 9.                                                 
                                                                                
v1 -> v2                                                                        
                                                                                
- Added necessary header files.                                                 
- Corrected indentation.                                                        
- Used the ret parameter in cci_write and cci_read functions.                   

Hardevsinh Palaniya (1):
  media: i2c: add ov2735 image sensor driver

Himanshu Bhavani (1):
  dt-bindings: media: i2c: Add ov2735 sensor

 .../bindings/media/i2c/ovti,ov2735.yaml       |  108 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov2735.c                    | 1109 +++++++++++++++++
 5 files changed, 1236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


