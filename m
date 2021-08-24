Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4283F5FB6
	for <lists+linux-media@lfdr.de>; Tue, 24 Aug 2021 16:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237825AbhHXOBc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Aug 2021 10:01:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62502 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237778AbhHXOBY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Aug 2021 10:01:24 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17OCi5H5000921;
        Tue, 24 Aug 2021 14:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=fk9pkVixpUeI3Sf8kIWCUDRrxPKJUzQAWU8xFsVht0k=;
 b=EcRveV25OdihwtDQzE2PUv1SR06HEoKcpZw4a2zgS3oFuGUevUfiI56j86QrCdCRhETV
 /7d6LCuSf9bNEwOO8Lpo1farHcYbz99VIng9PuERgqJdh1d4JzrpGfDQtTsVurQUIeqc
 s8DxcVYiEUJnbyCEev4qA3c6SYuPU0eJiGYJU17BoSoPBpB3cp2N7DQV2J30RuutJTpN
 TD6dk/xEq517JOXwbZQHNrQuqdaNexuShxENmp3zfl1TfmoWAWOY6x5EoPClwa/XC83x
 M6j8xRaOulib0r+bHTKKgc0ETLl4nE2p7gre1J8Tub8FtRESf8ELeV3aq+/w9WK1ALJz Cw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=fk9pkVixpUeI3Sf8kIWCUDRrxPKJUzQAWU8xFsVht0k=;
 b=frENlFFCpdiJJ3vhEMfUmECl1Dd2TWyotaIGvaNQj9zxO0PG3o3LBCNprCOMzYrABFyw
 p02ec11FRxnuX5d9l/7TlOvrLkvUyJ7LdFwDqwIPxahSbStUUq0tPc9INHdXd3VFdsIW
 sgX+bl0nwa5KKEOBi7QPjxtUsd6xUUdHBS/huhOcc2U9dPVCiGWCoavcPkJvnfd0ua3T
 coz2hPwiCv7fmKj47R2T7875cwm+eE49wrGoJYGFOcHfwNx7Od1ml6K2FgXomRlh4p++
 vd2Vc0Mkd+4j/aD0v9m4FVUQtY8Zog4hPXmx7oYuXHs2bITdJGF2SH8/2CsUGOcAk2fR Dw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amwpd8nwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 14:00:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17ODtWRp179909;
        Tue, 24 Aug 2021 14:00:26 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
        by userp3030.oracle.com with ESMTP id 3ajpkxbpxn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Aug 2021 14:00:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCCyU3DH8xoDUzsZuQI+yvtNr00ngvfykoV1OqdFR7u/vrCbjFH1HV4ookHmOhdAx10wgRm2oK7Yd0NYeb2swNgCmIVkaZA/e3FQeswhZK9yRldRKYZY4kAJYp+WJxlOz+exDuMFNkCYVXihh5kdxidh4YR+uCyuCMo5BZRokWLQfE0DfjF2CzmZg1q/3loNoDyt433jG0hBoi9RbpkUwpVifPNF9haH2TTszLch8ict/P4m8oRmdVl+9rTLWOejvFEnFQevXm5Dx6Un5QSCijNGAUSwu1WzTh3o/rH8bfA+z3PgyPwBRShdvaavY3scKyJAceE4B2RBC6yALYLAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk9pkVixpUeI3Sf8kIWCUDRrxPKJUzQAWU8xFsVht0k=;
 b=TJbsy18a81aibbWMDct0WXYDywJYSQRFtV6hUblshHsnQV5HEjyPJL9pLcbhRRtiQxnnxkESNWxA/OdepEEj1djmIrTul5VqgUmJcAONKrYcRsxAh0AmlggLQvqDMau5P8+2f9zjaEZRMKBivt+cvsOHA9SyMW0pKEz1WAWO1cUmF3gJ3uwRA07U6oEm13Av1NnhxjVjme/pvZjTnVIyh8ZyR3erebHIwH12JVTbkP+nqmKCz5kA/c90X3xb2/jd+r22pfGb450Fqk01xPGHw+YaI3uZ+vncw4Uusj3GByfBeRUKZkc9Ve7S8+hw/b1j3CFPjkQY3W4cnePSDitufw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fk9pkVixpUeI3Sf8kIWCUDRrxPKJUzQAWU8xFsVht0k=;
 b=GYHh9wKNmO3z47kIcFpMWIqCTANAoQVD3kd5k/ej6Y4PaaCk865KfGr8Hg+DNyDex7+pqCWKNWlWX6qTsYVpI8/IEaOUpvv65VSuuWdl2IfnVxCIpFRZd3SOzjHXuK0P469Ho6veELmLDwFtHdJd6EC3/mCVWe/XDaap2Wo+0cQ=
Authentication-Results: pathpartnertech.com; dkim=none (message not signed)
 header.d=none;pathpartnertech.com; dmarc=none action=none
 header.from=oracle.com;
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by CY4PR1001MB2263.namprd10.prod.outlook.com
 (2603:10b6:910:3f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 24 Aug
 2021 14:00:23 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::784c:a501:738a:143a%2]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 14:00:23 +0000
Date:   Tue, 24 Aug 2021 17:00:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     sidraya.bj@pathpartnertech.com
Cc:     gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, prashanth.ka@pathpartnertech.com,
        praneeth@ti.com, mchehab@kernel.org, linux-media@vger.kernel.org,
        praveen.ap@pathpartnertech.com
Subject: Re: [PATCH 09/30] v4l: vxd-dec: Add idgen api modules
Message-ID: <20210824140005.GQ1931@kadam>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
 <20210818141037.19990-10-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818141037.19990-10-sidraya.bj@pathpartnertech.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23)
 To CY4PR1001MB2358.namprd10.prod.outlook.com (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 14:00:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c3c74c6-1236-4646-0762-08d9670783ed
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2263:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1001MB2263C82B23744A8064EDEF5C8EC59@CY4PR1001MB2263.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L1fU1GEFiqEJGvIz8JYIcmrwGIexkqeif+BXdOu52Q3FYm9ZpnYt8h/l8GL1LHmJDYj3aqiImycOFIPtDP26/QkqNojawmvSu6pkejBoPjuD/0/9Iq7Vfb6PIgbHQdVg5P1c2XNftz26HwnnWckhbg+9FtoBuUmqBiSeZKsPRZg6RGXxqm0K2YoG93KzqVm8zPwhsXrN/1MxSTliTAl8DAiaCsN0wRe0nzRqW1TwqXe3WkiAT9t6qJD6U9F34rKLhfyu+b3FRXaxAa74mi67rclsQyrVkk1Enbk1k1e636mwhVoOJFuxNfttWOic4c+V1e3yvs3uxpw9O2nXKARHQb+EQ7VP/g2iHPcnjjLDr9eiRM+my6JoRksGGKhxF/7sAKATxXA+rMIT/pZDvFjIpxKXgMVhgRbGbeQiarP8LZEljlrRwuxXDyvZLkfVZdsnV8xmZEtUwoMI4lmVh73hai42QAmU0Ii52ucaK6ctN0YOg2y7Z3P/TVAnJdjfNLUIB25Qp54A8yyLyEe71MIYImtYuqi+3/rEpKg+yaO1HtLblh/OTbDA3Mj6wvXdR230OH9/k8DvnDEv3dUGlQs6uvvcDjsO8W9KQl2uQCy2NqVxotL7r7V23dBRmJgiO6d1wkkEuRImeLlsesFvKh6fbg55sd9MGLQb12zvSMFuXabbAapVA43uOwGT7ogrnDn6M69FSR29KAbQUgl8QFP8zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(366004)(376002)(346002)(8936002)(86362001)(26005)(33716001)(66556008)(44832011)(9576002)(956004)(55016002)(6496006)(9686003)(66476007)(186003)(316002)(478600001)(2906002)(4326008)(83380400001)(5660300002)(6666004)(33656002)(66946007)(38350700002)(38100700002)(6916009)(1076003)(8676002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TSavSd7KeFQN3FFOyDWhad7YzHq0dYu4GRZNeSa+g96neX29H50Z0biZf0vg?=
 =?us-ascii?Q?F2fnv2d0GJaMrivVUXbrkdP5bsxckfmN55eQMIs3nM+9uKus7V8l6YDdbdKX?=
 =?us-ascii?Q?iG5mnkXFh8586mG4JOtFP/w7Yfk6cjsoSih2QXh3iEbslMtdvGYII5FJIoJy?=
 =?us-ascii?Q?bfbGkKz5lsZBHLXNkbVoQEhBewoY6I0QzGdZOEg90ZmjI4Ffidq4AOq+zYxc?=
 =?us-ascii?Q?wsdZlS/dwR70DhqLQdwMAdLuC/RvT3VVwOmEDQGjjWafMb64eyy7JHQ727QI?=
 =?us-ascii?Q?TzU4pvXU1bRJJvjyD55y03PclFMVHn0MNATFn69OsWEMS0sdH+OGDpOeRwRa?=
 =?us-ascii?Q?6fDeTw/vMMlk+ePizUbJABDUwS+6FygPaikUswBvuslpcmQdv7HRIBr2YVeG?=
 =?us-ascii?Q?E/noGOjpWP16jq7osjFLcYFqzKZ+TNpfA7RMKJgANRpPu5uaILj+pJYcETZY?=
 =?us-ascii?Q?f3yGu+DZcngd4hVEKj3UT15iUKazaPhi7EpmzOSp0afOBN2K7OlumkJMBl4l?=
 =?us-ascii?Q?aeOSgiAFgz0PG97o8J1SAgB54j33wewaHRNGJ9ELszlZB3x6AsazivH6K4Ia?=
 =?us-ascii?Q?odoYaDJgk9mM0MPUcH1morzSbh6BCwCe2oyy3QNK4yXFNHs+SRSK+8KbZ5Ge?=
 =?us-ascii?Q?hkPgCpmVtmOj448vHtEcBjenpduxls4DIVt+eI4KPG4wGxwK4DRQmqJPbbG7?=
 =?us-ascii?Q?/KpZAUcrzZqlre/yppxEqhv9+CxHGZQTovRSWoPoE97y/LgfoUxhdtosJQMx?=
 =?us-ascii?Q?+sQnxp0AfuaYgfIe0gmXn4loXNVK0NvA/12A2L9gcRVXiG9TIgsPycFb5voY?=
 =?us-ascii?Q?W9dHllDHEmcYOecnslYCPuEuWmA7HUTfEA/V+ORVanUWuCBQ9Ex90ZQOzadv?=
 =?us-ascii?Q?eQD/hKvK5fpv5UyGE7LwPKa/ZUkA/dKMR9xjLO4/lPjT1cCejHD4OYJZanfd?=
 =?us-ascii?Q?SLwpHas9uwzbqkiK+tLyiSubqsE3PhmkUXp62vHGGzNipZULxGGA3kJCejNu?=
 =?us-ascii?Q?KM+4lp/0yu9Is3U5fNhQlpHiXqeCKLceMbVWTYvcd9djvNANbdNgj/8evP9M?=
 =?us-ascii?Q?umNuz6yNXtIPGY2sKm2d95/cDmFdxFT+EAsgebTMDdnjf1H+El9LS6MC8LcC?=
 =?us-ascii?Q?Zu7PrBXJVr2wOpFOJ3YlU9ZhPVZmQOGNj1NNxgis/82BmahAVpZaNopRUV8N?=
 =?us-ascii?Q?P6oXvh66G8LcQjuzQ6jlNhU764y7BHhumTi77Dt7oilwRy/JRuAO6oTgzUhm?=
 =?us-ascii?Q?GJQS14o7c9hs/+vI7jHj83gkGE0zcEWFh8+jnrx2twEGhKBup9VcoBOsXrH8?=
 =?us-ascii?Q?+1jBrDN5YQeQEPp7paLsqYkI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3c74c6-1236-4646-0762-08d9670783ed
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:00:23.0893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkTAz+0/owPmXU5ucswu4sNbCiX4rlIUl+TiSjrLkVOqg7KEsBTiQp1zCsuoyhsnzG6PnBCGARy7nW0BiQK6o0xdXN7lXoIsX6QZ4ivvmDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2263
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10085 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108240093
X-Proofpoint-ORIG-GUID: dF4sKUg-yIFt2VvSh-X0wlYW5QLynYRJ
X-Proofpoint-GUID: dF4sKUg-yIFt2VvSh-X0wlYW5QLynYRJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Of course this is all staging code and we normally don't review staging
code too hard when it's first sent because we understand that staging
code needs a lot of work before it's acceptable.

One of the rules of staging is that you can't touch code outside of
staging.

But since I happened to glance at a some of this code then here are
some tiny comments:

On Wed, Aug 18, 2021 at 07:40:16PM +0530, sidraya.bj@pathpartnertech.com wrote:
> +/*
> + * Structure contains the ID context.
> + */
> +struct idgen_hdblk {
> +	void **link; /* to be part of single linked list */
> +	/* Array of handles in this block. */
> +	void *ahhandles[1];

Don't use 1 element flex arrays.  Do it like this:

	void *ahhandles[];

You will have to adjust all you math.  But you should be using the
"struct_size(hdblk, ahhandles, nr)" macro anyway to prevent integer
overflows.

> +int idgen_createcontext(unsigned int maxid, unsigned int blksize,
> +			int incid, void **idgenhandle)
> +{
> +	struct idgen_context *idcontext;
> +
> +	/* Create context structure */
> +	idcontext = kzalloc(sizeof(*idcontext), GFP_KERNEL);
> +	if (!idcontext)
> +		return IMG_ERROR_OUT_OF_MEMORY;

We need to get rid of all these weird error codes?  You can add that
to the TODO file.

> +int idgen_destroycontext(void *idgenhandle)
> +{
> +	struct idgen_context *idcontext = (struct idgen_context *)idgenhandle;
> +	struct idgen_hdblk *hdblk;
> +
> +	if (!idcontext)
> +		return IMG_ERROR_INVALID_PARAMETERS;
> +
> +	/* If incrementing Ids, free the List of Incrementing Ids */
> +	if (idcontext->incids) {
> +		struct idgen_id *id;
> +		unsigned int i = 0;
> +
> +		for (i = 0; i < idcontext->blksize; i++) {
> +			id = lst_removehead(&idcontext->incidlist[i]);

You're not allowed to invent your own list API. :P  Generally there just
seems like too much extra helper functions and wrappers.  Removing this
kind of stuff is standard for staging drivers so that's normall.  Add it
to the TODO.

regards,
dan carpenter

