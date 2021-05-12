Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58C5537BFB3
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 16:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhELORn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 10:17:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15468 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231162AbhELOR3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 10:17:29 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14CEDDh4029993;
        Wed, 12 May 2021 14:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=fZwZo6h3NXAD9L+KDRUrlCgKwXzRCavdrOYZsyLaWW0=;
 b=AtxlSA2U0jcu4MS1lubZLnUWP7TYRTEbPFH3KEcagHiuOQK4RjwwrgABx8OEcqslDrmv
 07N0A/MjtDUQrsA3ILuDQJ6QAtFpwKBmpEXNNJih5Flhej0s9WXLMV6t07denGO2WBOW
 Io7pLnDNeaQBFL9vcNGAkQnTa3cMkZ1nw3qtVz8Zt2bQi9JcxyjCYjPDNhsEbOrooeb8
 gDIFei+XKBfHB8hQqgEGK99pg938UYWZyJ9Xc3LBiMCAwLR4vkxJzu61esaUb6TF9pou
 gI1bqI5Et3YLoxqTaOC/xVQ+Fg1lYL4Fj4QAeSdnGkx25A0N2uTXfjB5MEhxh6brVKXU 2A== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 38eyurrsjq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 14:16:19 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14CEGJK3115813;
        Wed, 12 May 2021 14:16:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38e5pyy0w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 14:16:19 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14CEGIaP115807;
        Wed, 12 May 2021 14:16:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 38e5pyy0w1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 12 May 2021 14:16:18 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14CEGIDG019784;
        Wed, 12 May 2021 14:16:18 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 May 2021 07:16:17 -0700
Date:   Wed, 12 May 2021 17:16:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     baijiaju1990@gmail.com
Cc:     linux-media@vger.kernel.org
Subject: Re: [bug report] media: tuners: fix error return code of
 hybrid_tuner_request_state()
Message-ID: <20210512141612.GA1922@kadam>
References: <YJvgLgZAEo5NtM2x@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJvgLgZAEo5NtM2x@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: THaWaklJ-561kCwdx9L5Z_aV_Sa1irfj
X-Proofpoint-ORIG-GUID: THaWaklJ-561kCwdx9L5Z_aV_Sa1irfj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 12, 2021 at 05:03:26PM +0300, Dan Carpenter wrote:
> Hello Jia-Ju Bai,
> 
> The patch b9302fa7ed97: "media: tuners: fix error return code of
> hybrid_tuner_request_state()" from Mar 6, 2021, leads to the
> following static checker warnings:
> 
> drivers/media/tuners/tuner-simple.c:1112 simple_tuner_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> drivers/media/tuners/mxl5007t.c:885 mxl5007t_attach() error: potential null dereference 'state'.  (<unknown> returns null)
> drivers/media/tuners/tda18271-fe.c:1311 tda18271_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> drivers/media/tuners/xc4000.c:1685 xc4000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> drivers/media/tuners/xc4000.c:1699 xc4000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> drivers/media/tuners/xc5000.c:1397 xc5000_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> drivers/media/tuners/r820t.c:2350 r820t_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> drivers/media/tuners/tuner-xc2028.c:1500 xc2028_attach() error: potential null dereference 'priv'.  (<unknown> returns null)
> 
> drivers/media/tuners/tuner-i2c.h
>    109  /* The return value of hybrid_tuner_request_state indicates the number of
>    110   * instances using this tuner object.
>    111   *
>    112   * 0 - no instances, indicates an error - kzalloc must have failed
> 
> The comment says that hybrid_tuner_request_state() returns an error.

I meant returns zero on error.

regards,
dan carpenter

