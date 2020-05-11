Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB8F1CDDC2
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 16:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbgEKOxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 10:53:15 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:57040 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730546AbgEKOxM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 10:53:12 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BEh4cb141576;
        Mon, 11 May 2020 14:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zhsIXIILq+2fhsWNRP7om+IXYVwNAADi+rrniuA99kI=;
 b=niYcMdefa6p1nRccbuWWpNqUeiMU4H5fbunpNMM95HtMJdo3ZU4RZfeA4/PsOSY8dIln
 k9xOEYI5yg60lysDRpc9kNIwpCpWG5vFXZHejtjl1/Nc9AKdm+TQDMz0lnynmOf2cosn
 R26EdnR4oWVheq0HCbJ9Tox7PBB7mDlhTqvqJ7ZOCRZMDcXU0cj+4kF/Spo5nmU04wWf
 UFY9q9DhaPS2vB0xpM43fmf3aQQ94LpV/+ABe4oR/CP3hArBCBQMDPWCbaId/aCmlJKv
 QObYvL/oVNyA+rVW5VWiSCl900MRvuhbpaQGW3Q8dP6xHeOfIHyJ9Bzmhs1zq4taR/Zb kQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 30x3mbnhn4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 14:53:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04BEiB74147018;
        Mon, 11 May 2020 14:51:08 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 30x69r5j3w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 11 May 2020 14:51:08 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04BEp7LC011848;
        Mon, 11 May 2020 14:51:07 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 11 May 2020 07:51:07 -0700
Date:   Mon, 11 May 2020 17:51:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     srinivas.kandagatla@linaro.org
Cc:     linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [bug report] misc: fastrpc: Add support for context Invoke method
Message-ID: <20200511145100.GA221682@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9617 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=3 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9617 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=3 bulkscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005110117
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Srinivas Kandagatla,

The patch c68cfb718c8f: "misc: fastrpc: Add support for context
Invoke method" from Feb 8, 2019, leads to the following static
checker warning:

	drivers/misc/fastrpc.c:990 fastrpc_internal_invoke()
	warn: 'ctx->refcount.refcount.ref.counter' not decremented on lines: 990.

drivers/misc/fastrpc.c
   925  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
   926                                     u32 handle, u32 sc,
   927                                     struct fastrpc_invoke_args *args)
   928  {
   929          struct fastrpc_invoke_ctx *ctx = NULL;
   930          int err = 0;
   931  
   932          if (!fl->sctx)
   933                  return -EINVAL;
   934  
   935          if (!fl->cctx->rpdev)
   936                  return -EPIPE;
   937  
   938          ctx = fastrpc_context_alloc(fl, kernel, sc, args);

refcount is 1.

   939          if (IS_ERR(ctx))
   940                  return PTR_ERR(ctx);
   941  
   942          if (ctx->nscalars) {
   943                  err = fastrpc_get_args(kernel, ctx);
   944                  if (err)
   945                          goto bail;
                                ^^^^^^^^^
Still holding one refcount.

   946          }
   947  
   948          /* make sure that all CPU memory writes are seen by DSP */
   949          dma_wmb();
   950          /* Send invoke buffer to remote dsp */
   951          err = fastrpc_invoke_send(fl->sctx, ctx, kernel, handle);
                      ^^^^^^^^^^^^^^^^^^^
Takes a reference count.  Refcount is now 2.

   952          if (err)
   953                  goto bail;
   954  
   955          if (kernel) {
   956                  if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
   957                          err = -ETIMEDOUT;
   958          } else {
   959                  err = wait_for_completion_interruptible(&ctx->work);

This drops a refcount.

   960          }
   961  
   962          if (err)
   963                  goto bail;
   964  
   965          /* Check the response from remote dsp */
   966          err = ctx->retval;
   967          if (err)
   968                  goto bail;
   969  
   970          if (ctx->nscalars) {
   971                  /* make sure that all memory writes by DSP are seen by CPU */
   972                  dma_rmb();
   973                  /* populate all the output buffers with results */
   974                  err = fastrpc_put_args(ctx, kernel);
   975                  if (err)
   976                          goto bail;
   977          }
   978  
   979  bail:
   980          if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
   981                  /* We are done with this compute context */
   982                  spin_lock(&fl->lock);
   983                  list_del(&ctx->node);
   984                  spin_unlock(&fl->lock);
   985                  fastrpc_context_put(ctx);

If we're holding two refcounts then I think this leaks.

   986          }
   987          if (err)
   988                  dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
   989  
   990          return err;
   991  }

regards,
dan carpenter
