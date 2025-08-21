Return-Path: <linux-media+bounces-40616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A5B2FCFA
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 16:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52FA5AE6092
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 14:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6ED1A9F8A;
	Thu, 21 Aug 2025 14:32:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020117.outbound.protection.outlook.com [52.101.227.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D6265629;
	Thu, 21 Aug 2025 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755786720; cv=fail; b=QsIdtDQtcUa74HsXs9PHHoZfrnuFONbg3VEiN+kjzBYcaFc+zA+FWmSOSwdcOkV7YwnEYR+Jsrc0whBct1V7IAyar9vn4xbdEdBDuDEkUD0EPUPs4kaZ/1bka9+r7pN2ZZVAdDHkWzgeNZ9CDyoq/Dgs/vURFMX0Al6pQ5Rg0do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755786720; c=relaxed/simple;
	bh=mqKdR6njindIsCoDC+zoTcw+S2lGpjvn363Grs8febw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lgRSP0YKHHYvwtoAPRvVkMhWbCxVHJrqHW2TQjyCM/Nne2CBBTvzHsJZnglc7FacDqQ1+5TaTIg58r2dRsoAVQLiXOH2YUI1NxHHgo9XYmZYkZUg2kd/JIyWtrzbrk7NXY1g18zBi+e9UoBk++cvMJuQlrI5uQ+utckniUxZNpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNyl7cdZcA8SX9MVNEnkav5Wz+t/ZSGM12zjVXQzUhc9j3C5rJS3WEWtCv6+9ULB5Xk4ttKwktngXGsaL+r2uBk/eGJiwVqj85kiAfU1g9It2BjYv3wHRdEABK5j7B1zvXUCeLGI0fBYVQVzEA9thoTepqJRUY6Xn4UKu9vGmPDaFOfqATPs8y1wH98fRAzSsDx/ZeNoSiwZJQ/zWPr4NYaiYwQ57NwdZBV/j/Ap6Cji3q6hG3C4yy7XPzUzEFkQs01HrM2/TF7mt4cCeNuBlwQ/taHLs1y013yeydaJ+/Rol8ae/mnexF/4YnIPfTkKHBFrXwgJoyeJCVpID05rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXANXp+ckjEsElKLSUKZxRUTtir+PD2EMHz47cgpTko=;
 b=DzbAKUhIw7MxpeqS63vf1iDO6tqLM5aIVLULCHsxH4RTx8J9STk7/kVHv6/a4cyGhn3zX6LiqZXcuC4trg+d3J4Av4+qxGSINDHbruVR7HAKRWbHim/whuzi3xWv+FcoMX4pWpnOyra/6/wBj1zZRTwKbAsAzwjpwq02EkxhynDSQ60CfK2PqgIupjK3WRN/s/Fig0nKBtc+bknvXB93gZBb6l54XsP1JWxyHm3Cp18e/yPeaSNOPKkcU/EIK/fDND7UrhPqpkqNtqXMf+jl5tqz1VRzbmDFA6fBspgojcjILwHdpaVOtrSpl2fiS5DBgo1P63lR7Fmq9J6TxD1yXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN0P287MB0576.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:166::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 14:31:52 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%6]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 14:31:52 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Matthias Fend <matthias.fend@emfend.at>,
	Arnd Bergmann <arnd@arndb.de>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/2] media: i2c: Add ov2735 camera sensor driver
Date: Thu, 21 Aug 2025 20:01:11 +0530
Message-Id: <20250821143126.319470-1-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::16) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN0P287MB0576:EE_
X-MS-Office365-Filtering-Correlation-Id: 28483cb9-f142-4633-d8a2-08dde0bf7899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/4Co32GZ/la3djMkR970mE+7rdFFsFcB9HsjZGbsi4NPM9iHIAI8mlOECB19?=
 =?us-ascii?Q?e+RKc9NPciNpbPkgSZicDJSIOvL/UgHH/EUb8MJwZ9ZPUhL0TWxUky8Ruqml?=
 =?us-ascii?Q?80V8oe0/+1aIew49SccyskbJB0kNneuRTgqO8Mk8ESXvA5sxR/wUFghmNJEH?=
 =?us-ascii?Q?aa3/hs+Qxgt5ZZlh+62Xv8cXNnPaKkghnPkID8mhMdXFZ01rs3tfW8SyLz4B?=
 =?us-ascii?Q?ubVk1a4eHPYfGuw79mohy4/KuHeUR5l42S2mJXGjukPwWLKFXK8ssGhFgXkC?=
 =?us-ascii?Q?hJ95ZCnRQ6Ef2gdGSCHmjdoICyP1SrA2agPrRn5sq8fqgxECUFwAAu2npmr3?=
 =?us-ascii?Q?T7weeXaiS/RsepCvTVWi/yiLK64haMxWyAih2uG/Us6R+7Nsf91Psvb0rsVU?=
 =?us-ascii?Q?S/TMEHkFIww6d7MwkqQg9IVJLE6Lss+WeUB4KkRnELSDFbXqJyiTPdHHzN7/?=
 =?us-ascii?Q?q118U678V4GxgQDdsEaYZQRd5UuQZfLyjun9YzBSCT3DGuI6WgR8rr7FNS/R?=
 =?us-ascii?Q?fo9O1nw9iBFxz2WP8MkoD3LUtto5PxT2AyNGfJkKxjRShiiHj8AyDLPaKzjt?=
 =?us-ascii?Q?1LEnkxnccLzSVXMHQiIUFOnf6X6V0AWZiz15UtemB/mTa2Ikv2WfBRJysJXd?=
 =?us-ascii?Q?Pk4HVV9w/5FPblLnK/3EiPI2SeYDkSPL0YRiUTKveBP7wsiMFf96hGXFYI5n?=
 =?us-ascii?Q?7DTRaRWp3/TNNyrq+iq2ZTLcjCT5GTHuT66uCaLomgTzie2ex4XidhNznCij?=
 =?us-ascii?Q?Rm+tp1715Egk1YvfhF/rjV+p588f+zxCwGQQ5oK/+f/c9U0U0HreQSeAU5sU?=
 =?us-ascii?Q?zsrnse5gCrKYO1rBVcSPYnX3WHyGU//30sCk57UclWVxqlqyaFeaQkOD4Amk?=
 =?us-ascii?Q?e/EWlEvSsR+B/Hl0+Sq4rBAUpnIigbw2v9a6L/xhxsq797jorTRuD+QDHWC6?=
 =?us-ascii?Q?vRsdyyQVCMfvPm765IjZ+dd4B47fomaggjWiom+aegZWbP+DmDDGOMsnm4v/?=
 =?us-ascii?Q?z/mqNpq8W8qRcJnucp0N0fKXK5fcm9PmCFAH+f6e7d0jMBLZWuq2+CUo+s2l?=
 =?us-ascii?Q?hezpC5r2epZFN4rPtmZc/gFc/VxjPIsgsgPgjISHsXw51MMQsEnoZz/mkyUl?=
 =?us-ascii?Q?TMNnpkdcWmG+cwUTC5Gn6YNbSS7PQUNugoyOhJfiXFx8GWEznsWgPNQUlnCJ?=
 =?us-ascii?Q?Lx+pDEm10zUlNorHlbRld7clSlMLxJjAfIqgXWqAcJ7QERatQLXoA2tbrIwm?=
 =?us-ascii?Q?u1qnmk7tLKj/+cwlX7R5zODyCgHGNki8Sfe6JUGv7M2En2BqPEGimP/uSde2?=
 =?us-ascii?Q?a2vg9GLQ3K3EO0jj5RPqWdp/XC3aju/6iXBa2Bp1HN0ZQkObQtaNziYXnNx0?=
 =?us-ascii?Q?1DNjHrNKDPKqdsTGYRj0EWJjifV+4hrSuO+LXiTaKCX0vU6ZeP9TAFqV32l4?=
 =?us-ascii?Q?0z6wH+seIVir1HIFLkppXz+oqY0rs+eS/sdk9y7QgKSULHp06uQ/dA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yP8GtKnZ9zlRP4skc01mHXcUrTfT5u+drEwFfEn4tbu1fuqphClxa3WEofKS?=
 =?us-ascii?Q?VL9bI9D55Re8A9w04AXc2B6heKAII/y/VXeDTk3/2LnS6JwvM5KpPMApfu0R?=
 =?us-ascii?Q?iu6Oc0syHIZ36QXA4pg98/xl9OuEYivhqsH/PQHaOSUkaLpyFRkBDoi7AzR8?=
 =?us-ascii?Q?Al/lOe7UvPZcp2ka7H/rAlYdru2Oi2x6PRfErtrzvTRFIHzFKNZRFp9uIG1H?=
 =?us-ascii?Q?XF6eycLIT34gxXN7UD9/DCKOpf/xJ/xDRNuKkmFPrNGcS1S/XrPHPTBwutAR?=
 =?us-ascii?Q?ZyX/XkpH42jq3G6vvlMF7cyzxbLdtvurLfHpG+X4DY8i6m5TPDLIl4ptIjTc?=
 =?us-ascii?Q?NDI7LfnTfvh3+PsfUc8AM1iJdLFmFvpbcVJEyqxILzZuk+po0bZvDVSUjT9t?=
 =?us-ascii?Q?zio0J1WD+SEgKYCmsjFWNUAR0WISKCQJN7LcXHm0+nCtibI2QrtKKjpDCmwm?=
 =?us-ascii?Q?7cAgliop6JbwQvf29sglzfrqeglCkREvwX+WsYTeKY6tWyWOvmQMgCkIjfH9?=
 =?us-ascii?Q?uSHwX6CIj1trF8erMy+cGKyEZexE9Eag9dp9lXw8yNhMByPKmtFIhsOsKiSb?=
 =?us-ascii?Q?SwhPdAwIJAnM86XVDOpAUb7904249vxvkj/zppEkh1zpHkKPPS8HvUyGBDyw?=
 =?us-ascii?Q?NrNVFSrEOuQhfJBO0wX80CjmOGysVqeMXhOdHzkDIhzNykhNtQ0JdzF2dIbm?=
 =?us-ascii?Q?62kTeJvRXaVbwjkjKzJDAGP5SQtBbeWsqhym74chVlRKDMGPmfP6ZVeg8Cg1?=
 =?us-ascii?Q?D1RchzWWj+gc74STANgqFZsRXvO2X+HOWWjpWX2mUttxFO+nHwWIfPCcae2X?=
 =?us-ascii?Q?ybCO6x/iqMnc8XmyddMgA7Hn8JaXadWgGj7Vir1TJmYsaHgYbM544ZwH1gx7?=
 =?us-ascii?Q?5qjQAdESd35GNtTqIbmalPfDjXsTsoWEX3uMFURYsBfthu1Hd/BD4xH9CPc8?=
 =?us-ascii?Q?eRaNCsbq21a8uBu3Q87gXjh6hXLlI0KpGacQxVmpNPv1gBNdOcNyi8m8BflX?=
 =?us-ascii?Q?9YGiG0z39AdTk4zS03Dp+zzEi8ODuNtwNDp+APi8zCnu/i9hymPyRZHZiayt?=
 =?us-ascii?Q?MGzElGvtYAM5NMQElYSbT92EW2ydZ0JkmD4ebuPJD8D+LDWV4dRgq70QNjjo?=
 =?us-ascii?Q?UTP7d0X5H3wDsGhqvXeeiGxgqj1Nc3qkB3NMUlFfcGk/vSuv1kHGVqWtbMWp?=
 =?us-ascii?Q?LdCdU62STJ4I/lHylKpZsgMygTLm3WkFBqKAf7zEqVSo2Cjmgc4HT7rAi+Dr?=
 =?us-ascii?Q?YocxSLwx7bN1JAlArgip3Eyjd8D0W6KwQVcWxggHRMXr/IFQ4G0S/0319JeF?=
 =?us-ascii?Q?IQJgUxwGKLrWDt+k6KoVr/0Q6ovdahMsjwI1+IpoMSH64vfPVn8R7HrmtsT6?=
 =?us-ascii?Q?/jecaoMgxcUL5X+vHZ1l/QDy1nS/9d00kvvqcP3GfhhhRTLDSGUr/+XuCU9e?=
 =?us-ascii?Q?AVvipTMCannJIEHYUoRabXQRZY8lrxGYS8c0OFutpnYk+vMcqg8Ug1C9Saht?=
 =?us-ascii?Q?zIr6wYEXxFXLawyCp7dwy3DOdjkIEzNmxfNhbIXTwJJb0GY23/6fy7OIKUlg?=
 =?us-ascii?Q?HETr7z9c+SWg+4Elb7K103lzBPeOvA/1MI0oFOg7LsI0Apr2gXPthGati09Y?=
 =?us-ascii?Q?VL1P3tF182ovQd6rNG2QBG0=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 28483cb9-f142-4633-d8a2-08dde0bf7899
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:31:52.4890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0a7BDJj1sFGZmxALbTT11Fd6tY94ZoFt/eYJCUPNF7GpK4PWA/RrvcUXTzAA15BrkYWg847P8VjSeNSYW+EFNZTtUNc48qbd7FE19XeJXSk58nwA7UDI/T0RJKHokZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0576

The Omnivision OV2735 is a 1/2.7-Inch CMOS image sensor with an                 
active array size of 1920 x 1080.                                               
                                                                                
The following features are supported:                                           
- Manual exposure an gain control support.                                      
- vblank/hblank control support.                                                
- Test pattern support control.                                                 
- Supported resolution: 1920 x 1080 @ 30fps (SGRBG10).                          
                                                                                
The driver is tested on mainline branch v6.14-rc6 on IMX8MP Debix Model a.      

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
- Address coding style issues (indentation, format specifier, combined declaration)
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
 MAINTAINERS                                   |    9 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/ov2735.c                    | 1109 +++++++++++++++++
 5 files changed, 1237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
 create mode 100644 drivers/media/i2c/ov2735.c

-- 
2.34.1


