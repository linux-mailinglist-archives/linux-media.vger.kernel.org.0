Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1AE528356
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 13:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243243AbiEPLeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 07:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243212AbiEPLeP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 07:34:15 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DEF138D9B
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 04:34:13 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G8kSDS020757;
        Mon, 16 May 2022 11:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=u+AvbsJvq6E5pAmF/GNktZNxsGMMIFNd5O5SA1Gbh50=;
 b=MuQm1P6F9raBuLj7ATQfrn/kpkN/3/B7PB13tMPTdWoF6mdF1bV0F+kWbwpxJkj67B1z
 iUdsNGHWFWEuBFdhjtOlPmMKmEpkf7zXrbufO5mQcNFWYYzvDQ/7jkudsofHHwqrNuK9
 /Zz1QgaQuYQFDxKqPKgVZFmoxYdHG4Iem8jTD04YWfvuZgfKkjfXdymhce1w5T21y2iU
 QkDv7NDU9IJQjQuITTzy/YsyaAUTlBzBNxPR9Hyw+ctIEeEqVlP6Gp6UeidyghISq+Z6
 GW1sia9sKjKONKcWhvXwDHpD5XGQov0lWY1vz5Aewgv5ua+9lBFgxtRYmJ8fTW762pYV BA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2310k0nk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 May 2022 11:31:15 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24GBG5eA010692;
        Mon, 16 May 2022 11:31:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22v79rfe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 16 May 2022 11:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9dmHGMqtCHr8NuVNCjjtqmoYP3p7i0rR3FbktkQkYf/pu12RoyG4pKcXtJWnUuv7BhkndbOdwTsFJAdhoz29fUWrJjbY7Md2gTwbtVwtBcZAL7Ip6mW/CVKw9fKJU1gfvqnGPGFggDG7IYICtotazu2kiqAoB6MFVBUt5vgRWroU2ykk+hSJgQ640sPMXBc+1463csf5m4GhKMKLhkLseUgWfmCdmAVx5tvVrc4stJv6iJ0G+BwoniyMuT+lNUEPM4fjJHPvKqgiaH4j3eJkcU3mMi1hu0bdZkzE1Pxe0ex2WSplaBY0RSXe0sOwV87CBARtVM0VGUza/TsoZ4j4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+AvbsJvq6E5pAmF/GNktZNxsGMMIFNd5O5SA1Gbh50=;
 b=gGbT4vFwkaYWwqvjb9fLnkhrSYmx4A18v+5dlRQzo3tnzn1hKl6ouKcOf620F+jmGCeP5rK/kK5zVsuV8Vkbm0BDb+hmt6xdNdyuFoVvUnJY1kT25wq1yXuKNa+iZjc1BTxcVomsJf07K6rJRnCShKatxmoBPrFMydL7V2Lu32VvFaWeYDMe2Eyd49a28IgVrPknNs6TsxqtXLl38rZWdkOVgxZLu2Dy0tCWXav8NlcHfMtLsNe2UuDnT9mKcUeWUvwtdxDe6Cbyd9M/k9BVea0s8DOysYVlukyCKiQf1WR5gE+NVx7tdjBflt5zcX536uN02hc6+pxrxSB66KRw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+AvbsJvq6E5pAmF/GNktZNxsGMMIFNd5O5SA1Gbh50=;
 b=yVoyUGrEMJMjLPTHuAqKBsMCh9JRRq0YIqly14dOZSxLHAUgBqxjNc5M0fEZB9UKoA6cIoHep75xiWnfP14b8mwtXl/eCV2e++9HYF/IHwH/TjTZ3sJvqu660m6NqTHQBUO9EmrlgLsBPQto+y47grMIkIYrvfe+wV8JbBszzAk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 11:31:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 11:31:12 +0000
Date:   Mon, 16 May 2022 14:30:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Jimmy Su <jimmy.su@intel.com>,
        linux-media@vger.kernel.org
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        sakari.ailus@linux.intel.com, andy.yeh@intel.com,
        jimmy.su@intel.com, yhuang@ovt.com, akeem.chen@ovt.com
Subject: Re: [PATCH v2] UPSTREAM: media: ov8856: skip OTP read in non-zero
 ACPI D state
Message-ID: <202205131109.giBGpLnO-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510151241.12435-1-jimmy.su@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::36)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b69bbef6-5d2f-4bf7-2fab-08da372f942a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3099:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3099A0C418D46C62856596A18ECF9@DM6PR10MB3099.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8GstoXpARgJy8OuapCAqFPG1AMPnWFtycpucFWIbjJ5H5sqbDEhILwXuR090+KYyPf8XSbU2k+y1yIoq6H0Fc2wceJ1FyQolwPDsWbwff7UcxdRpM52O6dVUeSqTSl9wzw83m2Lt/74hnrxSEo9MXa2D4Y4+LDXphu18X1W0fs8A6hiNll27lGgko3BXTf5vHg9WRcMthfc8TOxXLe8Nnk5nL378TJGzG1VL/NxzayJhvgavGL+xLeOVs5kJ6h4HwzQqP4dL4FI4WhB1F85Aho6AXVhRDnueyzFYwGwrRozrAZhHP9soEFiV2Misz5f8C+dAwEpw/3eh8b82d3AfBuMY4Quc0mK+elrMM+rsrtAzBpSiGTNdsgkSfMWqiDtyb+CdjMlbTyg3WWY9e7anfCh4FSYKvJqgUAZ3VxyoHZjA6IunAqCPSKC75GZAwbAlDfI+swTThuPY+ejqiw0ONa6F5B/yEZouKuImKoCm33rbibT20YC9r4eOeUSt9BnWKQe93ShgW1b+BOMWgg4MTynulaiQHAEHGeK+eJpqmO+7qV7vTy0+Xe+Dsr8jROYyJBqk6PYYm1qlmCo+fkfsWdXrEVU2N00fOfatY1nUA8n80UDiCcgSNyvT4C3GV7Zic/xteo2T1a+lx1cvDq6EqfofkYsZZ/EeZ5D01Si8L2yqq7VZZ5HKujl3s+JV7jCjiHBrlpejGg0HF36voBkIQ9RVz3wWq4QNuSsAbRYjnPKGtA3cdwpHYf5GXGTaTAOwHfUwPavlt/xb2VNOqXVUyrcDUic2IhS1H0igG2EdJzX+WegQ+eyIrUPna6wjMknwZSSYcztgGOetWhcCbiHscg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(9686003)(38350700002)(316002)(38100700002)(5660300002)(8936002)(1076003)(86362001)(508600001)(186003)(6506007)(66476007)(66556008)(66946007)(36756003)(83380400001)(966005)(4326008)(44832011)(8676002)(4001150100001)(52116002)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?71iiX1Qm9RqosMlVGIgobr9psqMZZbEBWJ1fsKfN1ntsGF8fncICRFDeJICA?=
 =?us-ascii?Q?60pFy8XQoLczDGDw6/56UkL4WoDQ0J6T3IIp6hezwQOhIOtLmDk4xEwaDhRN?=
 =?us-ascii?Q?jQst5hIL9zt+V+ZL74OMt+XCCQmkv9XPaVg3h2IDgUKm3aOUX89YmvaE3gvd?=
 =?us-ascii?Q?dlMg7FyaE48pAMJaoCprQiOPuxIvW1KZUMwp8B6aGXNY7k8eeOtarGUejdWw?=
 =?us-ascii?Q?w7gvEdpWzEfpWQ966EIKxBVqnw53LsyQ3mgWx3u69cHB1l6wPQlKgHd309tz?=
 =?us-ascii?Q?Wwd5UHeK68hurBvvqAHqiVFNtyfyROO70zga3cjzSJ6irsZIkpiCEZan3Z3/?=
 =?us-ascii?Q?Vrzsp5cLdZmrvw2JlgxEyaNQYBKzbGzEz4WrX0jfoCDRahbsrDkDgd704ehH?=
 =?us-ascii?Q?pwU95TO2gA+G9I2dcZDrukc31CBIu8jQOj5ElUR7F2V2R/07D+XJ+D1AfuSO?=
 =?us-ascii?Q?zJsQDHqEtDLkOg86JwQ4qkx+RUSKxV2aBNQxbbrHa11X4+oOBrWO9FmjdfYN?=
 =?us-ascii?Q?406sNa0pvRxpruUnxoWrBMqXh+xHRufL+Ts0rwKGlpz1Cuz5ZeOg2sRmZF8q?=
 =?us-ascii?Q?bnbaO+NjA3w8vxqzEZszMP5gQrmFP0co4R1gXVeOpp8rjFEBAwV0zH8kRliG?=
 =?us-ascii?Q?/I1HZH4FbrWSFVy4VHfcTSwvvJHsWbDXwYGb8m6HkTdkmNJ50mj0+hF2w/zF?=
 =?us-ascii?Q?1FsvC6wIYAqbKVb9J2DwQqb8n2/pMyhQqmymjQYmSKoCgqTBdG8u+OwYpHI5?=
 =?us-ascii?Q?PxT/MZMZ3mLoLJg0XCbplOuv4rFahbxr6YfbAxuo87voVyhfME5AuXVhyN6h?=
 =?us-ascii?Q?iexyjtHxdACs3Qm9Q+O/gvjJmwJU3NndeaVQtyYRH1XtWX/gui+QMY3P+KzV?=
 =?us-ascii?Q?4OfEPsl3OemvnOa6Nv/NO8nIfkPk10sRUAFFj2mkXcs8RKDnyd/I1+whZSn2?=
 =?us-ascii?Q?6OZ40xgzdZ6bkDSf3RLrZRz4CrX8ekWplYngvvvIPFjRwCML5NnZsyHgKTI9?=
 =?us-ascii?Q?2lXKaLbZSeiQfcYsE/27qtu4MPN7yjyvlwq0rtTTFXQq2/LzSZc6XhOmW1in?=
 =?us-ascii?Q?tKLnS0X9HmeyLKrYXy8ugGwx9ZDlBui4SFKi/4Vdevh8icjGqRADRNx1BGAP?=
 =?us-ascii?Q?4oic9h7ppwmghBNmplEbVUabzImppzsNSO0M+lLGQS0pBGroM2N5uZaL6epf?=
 =?us-ascii?Q?AsPaKfHCAcsCk/q+vv2s/Q/mOdSjMrRtq8J0gUf/CxVoWwW7eRGOAYNM4GGi?=
 =?us-ascii?Q?HlxD/nVqaium2gGreM2LNE0S6PJcPCdmYs0olhjqyQDv6wS8Z5PwaUabmJUn?=
 =?us-ascii?Q?TGG/7eL8QZkyPxS+rkNieykXEvCvGRfDESrSipQLf+08HHzUvXJUrS6Qs8qw?=
 =?us-ascii?Q?Exk/kRQ9SHlvQ3eX+IxR4YMJunFRzWi+S0AQt/TqFifS9FbHxosHZfgdOWxG?=
 =?us-ascii?Q?SsEDPhsMwILbV70viULRD7YrszG3sIJolLOZPp4ToDy/bDFyckro4uZxNuy3?=
 =?us-ascii?Q?PKT9pVUqsSgU9MzEEuIGsP1NeuBE4WnPBj1HKoG7fzf0giFzrarQNVl89DxZ?=
 =?us-ascii?Q?lXhTYuf9ZsK98MWD9PpE3z8L2IxnWOlyWUwUxwl/xKQ+eYLdyNDVHM+kvWtM?=
 =?us-ascii?Q?ETE2cX9p6HUhk0JC7ktOi8uFSlzH17Fn00NPgl/OOe8UKhhypP/WrlFVG6dr?=
 =?us-ascii?Q?3kRLrY1H7M/kNuTGYkOah8uwJUkiZE2/Rlakgalgo0fedc2UYqliFTbDiTxL?=
 =?us-ascii?Q?OaPbZMBWdljzALrfSmvLU3tVnR9p9gE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69bbef6-5d2f-4bf7-2fab-08da372f942a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 11:31:11.9973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WspOlXRNDPnIfE5DLDr5G5+ZH+emlUSyReQy/QwjiQT6ynQxJ1toG0qLx9lNTnnL80TKwkUerH75oePhkXbMyw7LFbx+BFpEU9ywbTcAAyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3099
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-05-16_07:2022-05-16,2022-05-16 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205160066
X-Proofpoint-ORIG-GUID: WQr07CAQpZWCW72vAychu-SwJC9QHPt-
X-Proofpoint-GUID: WQr07CAQpZWCW72vAychu-SwJC9QHPt-
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FAKE_REPLY_C,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jimmy,

url:    https://github.com/intel-lab-lkp/linux/commits/Jimmy-Su/UPSTREAM-media-ov8856-skip-OTP-read-in-non-zero-ACPI-D-state/20220510-232606
base:   git://linuxtv.org/media_tree.git master
config: nios2-randconfig-m031-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131109.giBGpLnO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/i2c/ov8856.c:1715 ov8856_identify_module() warn: maybe use && instead of &

vim +1715 drivers/media/i2c/ov8856.c

0e014f1a8d546f Bingbu Cao 2021-12-15  1694  static int ov8856_identify_module(struct ov8856 *ov8856)
0e014f1a8d546f Bingbu Cao 2021-12-15  1695  {
0e014f1a8d546f Bingbu Cao 2021-12-15  1696  	struct i2c_client *client = v4l2_get_subdevdata(&ov8856->sd);
0e014f1a8d546f Bingbu Cao 2021-12-15  1697  	int ret;
25bf233398211c Jimmy Su   2022-05-10  1698  	u32 val, width;
0e014f1a8d546f Bingbu Cao 2021-12-15  1699  
0e014f1a8d546f Bingbu Cao 2021-12-15  1700  	if (ov8856->identified)
0e014f1a8d546f Bingbu Cao 2021-12-15  1701  		return 0;
0e014f1a8d546f Bingbu Cao 2021-12-15  1702  
0e014f1a8d546f Bingbu Cao 2021-12-15  1703  	ret = ov8856_read_reg(ov8856, OV8856_REG_CHIP_ID,
0e014f1a8d546f Bingbu Cao 2021-12-15  1704  			      OV8856_REG_VALUE_24BIT, &val);
0e014f1a8d546f Bingbu Cao 2021-12-15  1705  	if (ret)
0e014f1a8d546f Bingbu Cao 2021-12-15  1706  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1707  
0e014f1a8d546f Bingbu Cao 2021-12-15  1708  	if (val != OV8856_CHIP_ID) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1709  		dev_err(&client->dev, "chip id mismatch: %x!=%x",
0e014f1a8d546f Bingbu Cao 2021-12-15  1710  			OV8856_CHIP_ID, val);
0e014f1a8d546f Bingbu Cao 2021-12-15  1711  		return -ENXIO;
0e014f1a8d546f Bingbu Cao 2021-12-15  1712  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1713  
25bf233398211c Jimmy Su   2022-05-10  1714  	width = ov8856->cur_mode->width;
25bf233398211c Jimmy Su   2022-05-10 @1715  	if (ov8856->acpi_skip_otp & ((width == 3280) | (width == 1640)))

I think Smatch will not print a warning for this if ->acpi_skip_otp is
declared as bool or if Smatch can determine that it is boolean from
the context, but the kbuild-bot does not do cross function analysis.

But to a human, the naming seems pretty likely that ov8856->acpi_skip_otp
so && and & are equivalent.

However && is more readable.

25bf233398211c Jimmy Su   2022-05-10  1716  		goto otp_skip;
25bf233398211c Jimmy Su   2022-05-10  1717  
0e014f1a8d546f Bingbu Cao 2021-12-15  1718  	ret = ov8856_write_reg(ov8856, OV8856_REG_MODE_SELECT,
0e014f1a8d546f Bingbu Cao 2021-12-15  1719  			       OV8856_REG_VALUE_08BIT, OV8856_MODE_STREAMING);
0e014f1a8d546f Bingbu Cao 2021-12-15  1720  	if (ret)
0e014f1a8d546f Bingbu Cao 2021-12-15  1721  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1722  
0e014f1a8d546f Bingbu Cao 2021-12-15  1723  	ret = ov8856_write_reg(ov8856, OV8856_OTP_MODE_CTRL,
0e014f1a8d546f Bingbu Cao 2021-12-15  1724  			       OV8856_REG_VALUE_08BIT, OV8856_OTP_MODE_AUTO);
0e014f1a8d546f Bingbu Cao 2021-12-15  1725  	if (ret) {
0e014f1a8d546f Bingbu Cao 2021-12-15  1726  		dev_err(&client->dev, "failed to set otp mode");
0e014f1a8d546f Bingbu Cao 2021-12-15  1727  		return ret;
0e014f1a8d546f Bingbu Cao 2021-12-15  1728  	}
0e014f1a8d546f Bingbu Cao 2021-12-15  1729  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

