Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE0F4464C5
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 15:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbhKEOYy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 10:24:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29344 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233139AbhKEOYx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 10:24:53 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5E5pNN014213;
        Fri, 5 Nov 2021 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=nePZAdlPHzokOajpttFzlHCOrNFO110Bff3G2wq63uk=;
 b=GwHu1fv3f8sHeE/wWbnTn+2si3HzKE80a+U1as6wCCYM9IJ1soPnWHDMQL+NXdE33vc+
 xArxMwmsGqF46UJxLjzY1a7ZMigJS9K1K9OCMD3zrmEsg+uFbm5+/zxaswtFIt+gvSZK
 qSE3k0kchWPBnoBl7fIUbf9lia5QXBmxSb9/nI6gYD7bYpJhtOXKuRVoN0A4xNymhBlX
 HiEDvqWHJBP1wtlLr7H77iEH2kjwawxt2KroV6RkJ/m7bCakXGv/97zr+1Emdfc6PX2Q
 N0cv04YptrS8oS5pkAB5DUPvJ/YgcqYOzs+2n11Blqwvls10bQk5szeIG1z1dIF3Fk6V NA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7k2r53-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Nov 2021 14:21:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A5EG4ae153425;
        Fri, 5 Nov 2021 14:21:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
        by aserp3020.oracle.com with ESMTP id 3c4t5sesnd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 05 Nov 2021 14:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRk8qr65+4kdp91KdajWUagS2IZEjfq9zvvGq8MDiA9YGuAxz5l30J1Pg9ZcIU8Zw9SOfDkgNtE/UylbfYg8KmGXVnAzZGbN2COWXHqsYCKFs54bIHE1t1BB0L5OsIq8UFU4zIC1Uuj+gQOSMVY6aGAHlaUdSVaIlxXwBikkezupQRbGKBJcBDDkd0BhP4moJcjrEZhf5JwojNyNr/4dIXLtAOhjb7TMoHhRNCCW5kSVG49geN0m4iR5T4TxCDBYSOPUEYu08i3GFIXO4DN4HE4l1xQV3VUhiKwjr3u88vETVcJwrCLzn0QEgpjhNVXEn6CMsJBGvMKKUDm/f7Ts6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nePZAdlPHzokOajpttFzlHCOrNFO110Bff3G2wq63uk=;
 b=QxKpUXPBfvSteae+kIFVdjVikXzjVnUcSMkbzKUmF9H0U/54UR14llNntEANbLSw4o++rxbQuOCtD0vSxmMyamUBmpiJx1yA9rnwabpYFBO+hPClJmcJhA1IGooxCOzT5mLl9mDypcsrbwZ7aU6k5qOwxGVw2X4Sj+GPJnPL13eK3r+WdzK8rqRDtYKPubb+tta61cpXhlUs48X3qi8e58S/b39UpIitmWAZaqo/mXB0dBuC0srNZ8aOI6eUH2whVPtwO3HbJEuLUIeJF14HRrpR0dSwjCWUHpw2A0InPNlrWZDmYm5Dq6wb9QTqmM3fbkXJtzd086PSxqJXjWHDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nePZAdlPHzokOajpttFzlHCOrNFO110Bff3G2wq63uk=;
 b=lvgjchy9qCkeaLZ9yw4SuAol90HT7kYhFJGOhga2rkRCGblYPda8YqdngFitmu8UqammL/EjpFpWwYkBkfHz+on1AChpEsV+ddHMTIaHhiikA9j4nSlWi6y2h1cuO474OfG3xuIVcRtZvI+t8SqaWF/rEHjNMW0zAHelSh9ISok=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5679.namprd10.prod.outlook.com
 (2603:10b6:303:18d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 14:21:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 14:21:49 +0000
Date:   Fri, 5 Nov 2021 17:21:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org,
        Robert Beckett <bob.beckett@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
Subject: Re: [PATCH v2 1/6] staging: media: wave5: Add vpuapi layer
Message-ID: <20211105142126.GD2001@kadam>
References: <20211013105609.21457-1-dafna.hirschfeld@collabora.com>
 <20211013105609.21457-2-dafna.hirschfeld@collabora.com>
 <20211013155025.GX2083@kadam>
 <35774ddb-da71-f37c-3fd6-ef47139f2f31@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35774ddb-da71-f37c-3fd6-ef47139f2f31@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::12)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 14:21:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab2c7fca-cfc7-46bf-02bb-08d9a0679aa3
X-MS-TrafficTypeDiagnostic: MW4PR10MB5679:
X-Microsoft-Antispam-PRVS: <MW4PR10MB56799D729DAA84345DA2AC6C8E8E9@MW4PR10MB5679.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XoEDLC/bPnFgGEOYBBm9HC1mKTj8Q2O9q32obJ3Q1/yxNVduBWpKHTFzzWpltILhOm8mISSQiKM3V3yaDi+mFT0LN8LJTr5JemJI6UGbxLdukeObdWJFArOUU9/4yyfe+RjVuEAe4QVHg0UThBfs5fi+sUQOgQD7NZn3A8lhg+lV44ZDqS9ZznrAfpnYDOqyNKcS1agu1W5pchsB4EtGRHO5OXMsMJ8Q8keNxl5l1ZrzaLTa7c6XHreC0SUVHJRFhW7K1fMuBuxmw1f8L767e4bRsqcqemowf4+G4Chl9OQyiReovi27ZwgbigU/d4hx9W9FR//juFeG6gdEnShsP11y0jqtH/Ze7lXrLEQ27hS89m3CDiY4f1++SulYowe3VyKUNLs42z8OeAoE1ymcImJ5OJ4NpWknrDq/tAVaJzxDsc8+cjKwMaJNIk3+UDAlPYalTdgcwAr4KpsvoGXsbN6PVMA2BK97g/3Q+jw9pZhmIpaua2VKbysrWILb5PYA3fLOymrFDHKNOZwGvAKcmp+nQhZ0pmHvv36JLvK5CydchweWMrqq7Wk1RRK2pI+4knawF2aE4qP6kAOzz6kA5JqFCex4iwVdyajEhO6QsKmRClnfNt/JanfuiA0z90R8qZQ9cjR0TPYECpVoi9LS8LvJXR+mlAXgc+bFrTz2I+sbG87e5yERP1BQ2lL7KpKq9EGkg/MsSjy3MdEWhJQ/uA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(4326008)(33656002)(1076003)(66556008)(33716001)(6916009)(83380400001)(9576002)(2906002)(7416002)(66476007)(6496006)(8936002)(44832011)(55016002)(38100700002)(508600001)(956004)(8676002)(86362001)(38350700002)(26005)(6666004)(5660300002)(52116002)(54906003)(9686003)(186003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FDGOpNuyZY8f2lkfQsXryuH0O8MmaQDFjahn3kl9sMEnGVeTqU7L7IJmCAjX?=
 =?us-ascii?Q?gVOdtCra3sm8ysBl5fwiEln1YUFDYtOn1jZwWlAvEx5h2WNexYCydFvqu1Fy?=
 =?us-ascii?Q?tQy8t69d0FZyV6xe08E/B0LT/PvE9l7NUNl5pYdxFDWo/9gFZHlHCIqZHLzu?=
 =?us-ascii?Q?w/qtGPwmQvgB9l3H/WtT17okIq9V3vJZhZSCz3hjNtPmmns8VZ50wkRHc1vj?=
 =?us-ascii?Q?slmnZ5vuwxwuQNXEVtzE4o687yLeNDjqwUY2nvhUPYqj1e0hwTA4fa/KbSNR?=
 =?us-ascii?Q?luXuMlzmNVcmv7SDbdAhypIeJgBf+7VI9vKVMXKhy6vkrTB7jOiF3DhBj5rE?=
 =?us-ascii?Q?Ch7nS3h9SUeiH6E5E0FCUESb0g2R1irAPeliNTqGwuFWGmfQ3LBofZ0xTw+x?=
 =?us-ascii?Q?AApRSeEhrYAX4AoHlaf/CUfcev0JU8uBaNr4EM2RIALgnbuqRH76b2QUlw4a?=
 =?us-ascii?Q?8Wq3yocD1gzHQMBYXhFgzzSsCXHacBI+aUjd32+ZBtZuPxTcx6r6JJ/DjhFR?=
 =?us-ascii?Q?xoKb0Sf0jw4qUePRKuVctf7TGjnODkNkWdFKkYkamYia0ppzXOnZzGaMMQiz?=
 =?us-ascii?Q?Vxsl7pIRMR9JsgqNHVvJs1vTS5ZstNRmuHNRLeA75fJp3bPhbK3PeUWStCUg?=
 =?us-ascii?Q?gTChw6zHFdU9eqXcvjevwmDp5PYCJHLZKp2T7fAQRhZIj0fhDZgzy2LRdeFe?=
 =?us-ascii?Q?v4MvcB8OZ/MStD+yYaJuaMcZ6t6fwkEqvQT1Ja9SYlSm0FlM6hNT2JXMj2W3?=
 =?us-ascii?Q?tVUkNkhw3LPqGrw+JFM8RJDD/ZWzuMXRAlJypuHUJIwg1FirWFOS5FL05N6L?=
 =?us-ascii?Q?CEb7maGk1KVoM4/Ub5V+QkAPzF8fqjFG9FhdbDS4HW11YTMtpnGtjxeMCCoh?=
 =?us-ascii?Q?QO/z8WEOoVf+XLXyxOwcR/DhldoEYaddv824VzbeRu2QT2g7bk2JHYSC4JYY?=
 =?us-ascii?Q?DNOhPOF0bRFJNaNK3nL1FUKwRsbUvI96NHHx4cFA7ywpEF5uFcglKGjMlS6N?=
 =?us-ascii?Q?0spKiYL+PkTDoi3hjOuzVqyLosKYOUcB8q4yGrPgquZSzdjms6kSjPNHusLn?=
 =?us-ascii?Q?2XdURAAVyKt6dlxeCSXVyzDwcSt6E0bfE79Ws9iKtfu+YGBju27oxthFup9j?=
 =?us-ascii?Q?ZpEhNdwuiMHk7U1D5/GMv+8/mKmSgTZfzxmd6P94VqD1jkY5qx+S2Jn6b8U6?=
 =?us-ascii?Q?AsOge9gmK1B3JHNy6RT8zC0ag2H2qUUcq8FouaTe0fSUk5t8r0esw+uAx6FH?=
 =?us-ascii?Q?38BUgA71N8fS1rXF4NIY6Cypz8Q3kJvO9SMvdThiMI4xnKHxycAphFEJMdKi?=
 =?us-ascii?Q?JfqM+AGIdoEvAaQVNnfK+5dcdOPp3viqJnK5qx2nakjgViavJ5CYTYbZ1YFn?=
 =?us-ascii?Q?Vn7TI7ah0eieyISPRvabimsXs0Xzy4MRtK828c+htBcVSvBw3moIuETL40Vy?=
 =?us-ascii?Q?MPfDmUOse0wkH6jfc2UqChLuqOWhj+sji3u2TbzYH4ck4nsAZyCcqHP9pBlX?=
 =?us-ascii?Q?rWxo1Ztv8vhuEabURPiAE7dfGp0JG6jnGiVALH8MyeG/EaBhSXdlDP7gfNZt?=
 =?us-ascii?Q?9GulgjCNdhU0gURd4XvYPp+hyAQYFi2HF8vpOa3NYkP65Jf4hgmtYx3qa1mn?=
 =?us-ascii?Q?68gzy3cvcyU6pMrFhUllz5mP0eBaVzZ4DNJOrg/W/jMWlQFmGkr4Ql3m3w/I?=
 =?us-ascii?Q?HV3fjXbCmz1S2TDuxbR5KZv1bbE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2c7fca-cfc7-46bf-02bb-08d9a0679aa3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 14:21:48.9389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZ/ROf4O+Iuiy0m/GfSsFnN8zhNDf2gQ+hrwCqJHSXi3iTQrSIV4RVGPTAql5ej78noccH9xKNOD1cSnkZIFNRvp/MvPg2jzcmv8RFvCiV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5679
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=920 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050083
X-Proofpoint-ORIG-GUID: AbOwOpEHW_2_nhyVlV7XvSJg8_zMZiV9
X-Proofpoint-GUID: AbOwOpEHW_2_nhyVlV7XvSJg8_zMZiV9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 02, 2021 at 11:47:24AM +0100, Dafna Hirschfeld wrote:
> > > +int wave5_vpu_decode(struct vpu_instance *vpu_inst, struct dec_param *option, u32 *fail_res)
> > > +{
> > > +	u32 mode_option = DEC_PIC_NORMAL, bs_option, reg_val;
> > > +	s32 force_latency = -1;
> > 
> > Ugh....  Write this as:
> > 
> > 	bool force_latency = false;
> > 
> > 
> > > +	struct dec_info *p_dec_info = &vpu_inst->codec_info->dec_info;
> > > +	struct dec_open_param *p_open_param = &p_dec_info->open_param;
> > > +	int ret;
> > > +
> > > +	if (p_dec_info->thumbnail_mode) {
> > > +		mode_option = DEC_PIC_W_THUMBNAIL;
> > > +	} else if (option->skipframe_mode) {
> > > +		switch (option->skipframe_mode) {
> > > +		case WAVE_SKIPMODE_NON_IRAP:
> > > +			mode_option = SKIP_NON_IRAP;
> > > +			force_latency = 0;
> > 
> > 	force_latency = true;
> > 
> > > +			break;
> > > +		case WAVE_SKIPMODE_NON_REF:
> > > +			mode_option = SKIP_NON_REF_PIC;
> > > +			break;
> > > +		default:
> > > +			// skip off
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	// set disable reorder
> > > +	if (!p_dec_info->reorder_enable)
> > > +		force_latency = 0;
> > 
> > 	force_latency = true;
> > 
> > > +
> > > +	/* set attributes of bitstream buffer controller */
> > > +	bs_option = 0;
> > > +	reg_val = 0;
> > 
> > This assign is never used.
> > 
> > > +	switch (p_open_param->bitstream_mode) {
> > > +	case BS_MODE_INTERRUPT:
> > > +		bs_option = 0;
> > 
> > Already set above.
> > 
> > > +		break;
> > > +	case BS_MODE_PIC_END:
> > > +		bs_option = BSOPTION_ENABLE_EXPLICIT_END;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	vpu_write_reg(vpu_inst->dev, W5_BS_RD_PTR, p_dec_info->stream_rd_ptr);
> > > +	vpu_write_reg(vpu_inst->dev, W5_BS_WR_PTR, p_dec_info->stream_wr_ptr);
> > > +	if (p_dec_info->stream_endflag == 1)
> > > +		bs_option = 3; // (stream_end_flag<<1) | EXPLICIT_END
> > > +	if (p_open_param->bitstream_mode == BS_MODE_PIC_END)
> > > +		bs_option |= (1UL << 31);
> > > +	if (vpu_inst->std == W_AV1_DEC)
> > > +		bs_option |= ((p_open_param->av1_format) << 2);
> > > +	vpu_write_reg(vpu_inst->dev, W5_BS_OPTION, bs_option);
> > > +
> > > +	/* secondary AXI */
> > > +	reg_val = (p_dec_info->sec_axi_info.wave.use_bit_enable << 0) |
> > > +		(p_dec_info->sec_axi_info.wave.use_ip_enable << 9) |
> > > +		(p_dec_info->sec_axi_info.wave.use_lf_row_enable << 15);
> > > +	vpu_write_reg(vpu_inst->dev, W5_USE_SEC_AXI, reg_val);
> > > +
> > > +	/* set attributes of user buffer */
> > > +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_USER_MASK, p_dec_info->user_data_enable);
> > > +
> > > +	vpu_write_reg(vpu_inst->dev, W5_COMMAND_OPTION,
> > > +		      ((option->disable_film_grain << 6) | (option->cra_as_bla_flag << 5) |
> > > +		 mode_option));
> > 
> > These are badly aligned and contribute to the Wall of Text Effect that
> > this code has.  :(
> > 
> > 	vpu_write_reg(vpu_inst->dev, W5_COMMAND_OPTION,
> > 		      (option->disable_film_grain << 6) |
> > 		      (option->cra_as_bla_flag << 5) |
> > 		      mode_option);
> > 
> > 
> > 
> > > +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_TEMPORAL_ID_PLUS1,
> > > +		      ((p_dec_info->target_spatial_id + 1) << 9) |
> > > +		 (p_dec_info->temp_id_select_mode << 8) | (p_dec_info->target_temp_id + 1));
> > 
> > 	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_TEMPORAL_ID_PLUS1,
> > 		      ((p_dec_info->target_spatial_id + 1) << 9) |
> > 		      (p_dec_info->temp_id_select_mode << 8) |
> > 		      (p_dec_info->target_temp_id + 1));
> > 
> > Why do we have to add "+ 1" to p_dec_info->target_spatial_id?
> 
> for some reason the code defines 'DECODE_ALL_SPATIAL_LAYERS' to -1 and then adding '+ 1' set it to 0
> no idea why is it implemented like that.
> 
> > 
> > 
> > > +	vpu_write_reg(vpu_inst->dev, W5_CMD_SEQ_CHANGE_ENABLE_FLAG, p_dec_info->seq_change_mask);
> > > +	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_FORCE_FB_LATENCY_PLUS1, force_latency + 1);
> > 
> > 
> > 	vpu_write_reg(vpu_inst->dev, W5_CMD_DEC_FORCE_FB_LATENCY_PLUS1, force_latency);
> 
> is it nice to write bool to a reigeter?, isn't it better to set 'force_latency' to u32?
> 

It's fine to write a bool to register or to make it a u32.  But the
point is this code is obfuscated where -1 is zero/false and 0 represents
1/true.

regards,
dan carpenter

