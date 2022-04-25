Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569C050DCF2
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240905AbiDYJmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240902AbiDYJlv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:41:51 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232331B793
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:37:25 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P6KjvO031587;
        Mon, 25 Apr 2022 09:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=h9iUg5B8wUL7qogTcpzzXkIgE8q3fVPa1arEZPy96K4=;
 b=xZjPgOCyR4a2/EeQZ5ktY1WmDNmI4XQqbIia2K04tqlRZHtkW9BB6w0sd0DANYvWxI/z
 feddGVurSzZKbx5ftDzZiAgjm4EGbv7gBfLCqnLOGi3gbIrm1d0HMkm/Uy6KVDuSChjp
 vuoFQzQllBOHJFsN5QDZSQ70BF4B1uUHdSVnjZY9errGbGG368LnQWVFmDEjlVK+AwvG
 MfIzKRMyot6TaQ5w0Tyi9yA5QBBSN3kN7T/qC6x8vRn0/vXP3CpO8mCbMjsS2DWL7GT9
 arpomgaoNP0MLtFr1C0faWBLtB4RKCbAcWk0YNECkA7ONC+rAosDg80Ef64lVKXPiVPt Rw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb5jtq11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Apr 2022 09:37:06 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23P9GK01027960;
        Mon, 25 Apr 2022 09:37:05 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fm7w2ajbv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Apr 2022 09:37:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDWEBEYFyr50rNBrTxo5FS5w0nIH80XO/1hqv2Yh8yU0MrYmmO/OTGlFlkK1/C2DRmOFnWk+j0BzY1f5LJ9/LAwmXK0aKF+Ggox6owbbsVF/vbT8/l4JBV/H9LoW9wy6wyii1g3CoOhE5zs5I8sdZepNBOfxPWvmZ5xEbZf667cmI6VuzlH0KEfW5sTg4qR+6UzCBKbfCJXWrYTGSw6FmTbZpXDGwbXnprJMyqdEFIw4NPo70C4tZOHaKyVaK2T5yFSnnmzXCq/fpD4b9xoZHU3NsuBiZJj2C4DETiLpU+SY6XqdEIuvOU1Cn6SQ4F2tiLqEypV70w48CCSEWemYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9iUg5B8wUL7qogTcpzzXkIgE8q3fVPa1arEZPy96K4=;
 b=GvJ4im/ghEOIfIZf4LU0fF0Hz5m5yuSuyGhFDPrmKAlq0zzPn8/Lf9vD3e5caatujE7XhL1Y2BpqYvoUTmk12xNlCjpbjr5sJyJcZApGinbNyb8XLiaKDQTkMlicQml+/lqXC/yZjOiKmmvrPbqGJVoRwhQmb3BZ4EmuANZ4nsWYFO/XLLkS0XNXKoJSPGfP0aRqT3VDr1xcZDglsJodAqfF41Ie2VGwkV+pwknk+bdeK7AwSBJAj1MMiWNh41DNgGdSrYmH+hZOprqTK+PmOn5DqVgfrwfjtWhhzttNM9x599C8VmCyZq0iNEIo8vtKeVmz4L4s+djdYaV5Wbo8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9iUg5B8wUL7qogTcpzzXkIgE8q3fVPa1arEZPy96K4=;
 b=w3ZFzMNjVWTajYyz5zQgWdW5tgDbEaMlTNvbx1TqKIexaWyqiQnVks+N3EiXMBeSt0+phxk5PWcOLZp6jMq3Ot+2b8FylTz7Qibc5GykSMCqA+cuk6j88w1qOt0KsEvc/4XPOZued8+e3UmHOz9rJ0mmDeHFLglzsnKLvAOKHzc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3249.namprd10.prod.outlook.com
 (2603:10b6:408:c6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 09:36:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Mon, 25 Apr 2022
 09:36:58 +0000
Date:   Mon, 25 Apr 2022 12:36:36 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ian Cowan <ian@linux.cowan.aero>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <20220425093636.GM2462@kadam>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423180111.91602-1-ian@linux.cowan.aero>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0041.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::29)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e0dbcd9-6c58-4d86-bcdd-08da269f245b
X-MS-TrafficTypeDiagnostic: BN8PR10MB3249:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB324935C9B3ACAF081C5E7E6E8EF89@BN8PR10MB3249.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J5syvVNQgEGJHI0eVfw8UcqNhWL2qd+6MPCrJV6sAbjyv78GysIezPsCc6opIYA9QEdNUqUSzM7b4GKHBN5KYvR1s8Rxfim7cXrv9nxMIF/IsJuFow1V1mw2ICOzQdgJK2W7/XI+MkMDKzqfp5ahtsG5nuVERhhZWn801agF9Zaizpspm8sW69SZbdXqmhTbiX5kO6bvEVfKeW4ev5Sq1q2L5kO/6BIziHDNrerBxYJ1OjChBCzUFZsUUtHEQvZqEwO7N+NWoz0Tkf1MGsDSOnq0R7/rA6Gn2aI5dVgJXGXRT+ul9UigwkQjXXww2Jipn05Ny/VTSvOysyaoRjd+XcDlfX+2Bw3Ho3LwV156SrQo6Ttd8gnQUa470eH1IRD2PdqH+IQQPKdxJe4ZEPZ3zmGL+Y4aW2HazZc4r7JUI27VVv2hN5mSSBTTb2Uxby7Pg4ksmSmbRiaoF86BXbRG0eAcyt9exHyx9ZN7JFD+sKK7lyWBe6lCoj+DU1hQac5d1zxa0BKEL6OBmgfEG3zc6Brm0nrX3L8jBoZRuR49dz2m2etZm+NJfkRJ8ZkTXfODrxOnc55jD7fk8pDNv5RBGfeskMarN9GBtPSnRgHb5VrFeVKdukKtumIZvGhae6LXQ2+o/tPmOS/TFthfFbWbA8bNiXbkFWiU11aKDZKSsAcawhrW6HykbNEScKhwpMbypiIQHEH0+38lOxdicvyr4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(86362001)(83380400001)(66556008)(66476007)(66946007)(2906002)(508600001)(38100700002)(6512007)(38350700002)(26005)(9686003)(186003)(6486002)(8676002)(4326008)(44832011)(1076003)(33716001)(5660300002)(8936002)(33656002)(6916009)(316002)(6506007)(52116002)(6666004)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cOpEmR3hMI77P7LBgiMGCJx11ub0OzpK6X9K6+moOEsMW54cSWIJsfEXcSa/?=
 =?us-ascii?Q?ZixtbVLP/koBa3cWbluu7Kfkpp6AE9HvT0IwQRMBrxpA/RwQbrNH+ebvZ6GH?=
 =?us-ascii?Q?HT8tBVGKMS90UrawnUscbULW/KLBEjgLAH4zwdC+VU/FUCJ84so9lLO2H9gK?=
 =?us-ascii?Q?m0Nvp0x/uyXp/daj4TSPRF7MPtIfMAZXAsU1JxjJjNTJwE/9k4FbDXY+5z1Z?=
 =?us-ascii?Q?syuFXQTQj3rYF2o9HaItl0iK/hGNAKphSzNU4XlpkIwX/PB9jSWAoj4argWY?=
 =?us-ascii?Q?eo4vHlcDmR1X+KSl3VVZdd4Nlua0Mkvua24xezy6ZThbnwbBPeaToj7O56RO?=
 =?us-ascii?Q?lMh47l4ne8ZGIZNK8NsZ9M3NR5gVLF9fIYKwjDghPpQcuDib1hF2gTG65tyH?=
 =?us-ascii?Q?v/oJ8b23hYui4QcdEEKNeQibQKMSHWhGNNy3/cdk2giQQQpJGz45JzngfZ6N?=
 =?us-ascii?Q?Pzpo33eNn4NpKmFhmdim7AtrQpOhR+aVKOZy4KFgtUQD+tmJiT8JlU3ruIHM?=
 =?us-ascii?Q?0fgBQeHwnpCik0ywKJ+bVIbXyfSjd7IRsdCzTrNAjvs+wZ6Fxz5KYIRHkUC4?=
 =?us-ascii?Q?LZ1KDSy6A0LV7NbHIuoWtbnUEh8+OgF6CBymXB2X3Robk4uqWD26vpUqB7/0?=
 =?us-ascii?Q?REzQk+nvx5E9zyqoq7d44R5f8x/H1vq0qmBTOf/s0I/s9VzzETT6E21pJ1KE?=
 =?us-ascii?Q?abEL/budO/cQUQ7ibB2S5EtRo+otTJqfT4u6Wkg5XbreDnLFuOflc4XHH6mV?=
 =?us-ascii?Q?7Wywc0hFPDl6ttJTJlcya1amZkvEeVllVi3PQa0GEVA984aFj0cnDFuOan0P?=
 =?us-ascii?Q?IJ9+ERFD0BXtbrd/YRsirhE/ZQyRMaETSQNmOqgyci7h4UNzANUaY+rRe7lz?=
 =?us-ascii?Q?wv2iO6RRZChxAn1AGlcb7WLAfcL1RgVZKYum/Lbg16pnt7bXFtjhhMejJrdM?=
 =?us-ascii?Q?l88uZY+czoa/arLX+5+hjS75BLZ1F1KDZGfKNb/8KEhjWw4hRjVrj4GYfIUu?=
 =?us-ascii?Q?iotEJT5kyGyTfhaWKlMBHEyedIIs3+YPYZ+TlSGPoFu+s14qTFqZUqEV9mbk?=
 =?us-ascii?Q?kbljKpX6r95C6+07n1cNj0RaCe7CvNAEtrMYL5S/hyb5DbZNNWokGgeCpbV3?=
 =?us-ascii?Q?obobMq6TYCyZhka+Od7hcEG0vpPfP709kkcbeMAOyS7lPPDYBaubV5quO33L?=
 =?us-ascii?Q?wk9AM7kECUKbI8p91k53h7Z0GsxlY3INOBAM7bwU1gMByKu0bWDzb2ax8gpU?=
 =?us-ascii?Q?PNq5BU/8b9vzWQr1zZE8SDwl0CPnMpraiOiSvUu4emx7zQ0DXtZbD8yuJX9F?=
 =?us-ascii?Q?WquA1IKAtTChKOKVvnjUR/g6m0jb+Rdm7rK6fT1gVI4FkkHI4VI3m3zJzOjY?=
 =?us-ascii?Q?s7rCIegSFHu8mYTpvhEsD9S6cAEBXydAmiKvyRGUscSc12QmLaCjqYd5TgSK?=
 =?us-ascii?Q?FyPBZCKTE1MrHR8T4aWYIBQhssi+i+7AI5svaDsZPcWyjVojwa8GV6Y61SdR?=
 =?us-ascii?Q?X14LVTD2Py+cuuOcsNchmEiUmCkiLD5ETcs7Hq80jKx6HCVwmyZ2z1ul5ZhU?=
 =?us-ascii?Q?WFNsWHIIWC9ZbklXIEGf0ca64+xTBBLa070XG1EgKnWnRRadT8c217HGMKZJ?=
 =?us-ascii?Q?b68ya3aCyxnBPIBpcgcc2Cj9V9q/6coBS1LC4Zx+4Khr2PrGHwRvh1CKagX5?=
 =?us-ascii?Q?nW12u/qFp9xTFxJHGp/72RPW8x8zqMnVFA7ueklL2Ih43RJVjZvALzXlKIAq?=
 =?us-ascii?Q?HBth0OGPj68LL3Vmf/NjuOo6ka91K7A=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0dbcd9-6c58-4d86-bcdd-08da269f245b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 09:36:58.2212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dytLNm2J+oKSHbkruoNdiRczrPZjbEdpWHVxJ+p3tBZrb4AP4o5VCe14Ubsx0GIPV/F9Yn0a+MNkNhp5+320rH3rnrAdp8nlAwCcxSIZOEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3249
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-25_04:2022-04-22,2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=781
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250042
X-Proofpoint-GUID: H1oqZ9NZgh6ecVKzzkz0evIWUjYbS2uz
X-Proofpoint-ORIG-GUID: H1oqZ9NZgh6ecVKzzkz0evIWUjYbS2uz
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 23, 2022 at 02:01:11PM -0400, Ian Cowan wrote:
> Refactor the cedrus_open() function so that there is only one exit to
> the function instead of 2. This prevents a future change from preventing
> the mutex from being unlocked after a successful exit.

Future proofing code is a complicated thing because the future is hard
to predict.

But one rule is that normally the success path gets tested.  No one is
going to forget to drop the lock on the success path.  Or if we do forget,
it likely will get caught quickly and it will be easy to bisect.

Generally it's best to keep the success path and the failure path as
separate as possible.  Avoid interleaving.  It's more readable.  If
there is no cleanup on failure then it's okay to have:

unlock:
	unlock(foo);
	return ret;

But once you have cleanup then put that in a separate cleanup block.

As well Smatch can recognize a typical kernel cleanup block so if you
write it in a weird way then you're disabling the static checker warning
for missing error codes.  I probably am going to write more checks which
are specific to cleanup blocks in the future.

regards,
dan carpenter
