Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA9A62EBFC
	for <lists+linux-media@lfdr.de>; Fri, 18 Nov 2022 03:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234728AbiKRChK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Nov 2022 21:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbiKRChJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Nov 2022 21:37:09 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3E58D4A3
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 18:37:08 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id k84so4162124ybk.3
        for <linux-media@vger.kernel.org>; Thu, 17 Nov 2022 18:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HRVnwEPfcbOzbMRSuMs2NCAF/YKRv3NoY+l+faUblg=;
        b=kHLH0YZhlWdDrEgGrLPz9ScoylswZMbdh04T67tjO/2HzqKAq+V2G0l4muslRCxzg+
         XCKNpW1eZlF8HrwLu0bwE9DIUnlOT8Y7y+9S6dUqcOq+5IuVnzRW0TgQ8r0C2kjXKBvB
         hoBxUXD8HY/BkmaFMWt/KDIaodNUFrDjijNn/1w9HeHfuppM7oRouEjnm5IvqR5SbL1b
         160DXvkdT4vLDOYaYmu0nMyhqKEVPiunDPabVeh8oCYdThAFJJkdeArsC3KZjCxR79rU
         JvuS8yxkEhE104xvnTdDcou4o20pmw0RUape/+jG6GjP4MLtepO8NiyW0VX25VU9GG1L
         4WLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HRVnwEPfcbOzbMRSuMs2NCAF/YKRv3NoY+l+faUblg=;
        b=XXrrkNIQp6+96g06JNSIR+dYO67VKAdCHZeHyV9f1vrRuBjCvdi+DdkNYlb8hHbW13
         TSMS83YFIqH3rqjOWO5CRJjwlrumehnV14GiaYRacNUjw8WfG23lqgHPniYMWzeTCHLK
         5vItld14kHH+/NH6qp9nDa3kr533V6ZTdoPi20bN94THOxWLbzSSXH6uXFtXP+5yNZXy
         FI9JYqSeG9dYlLm3rZ0yzhBTWEsUnl8kSJpFqzPrQmKn9bgcz9vmZWm0keX5sK6ZTLV6
         4+VZl0msxx07cjNwGSprhzQx3xvkKshHb/7xYWwDyW8/rrkKwg1LI6NKdx42QRg3xL9j
         UOxA==
X-Gm-Message-State: ANoB5pnR5QJ9Z3Q6SXEg9ISaYzo1iQuoTNSdUtenLKkZi1HZQmgmU1TD
        vLjAhOdxavIahBGOAQxp/GlfgtsL5nCm9n6uhsKvhyhlP6RToA==
X-Google-Smtp-Source: AA0mqf6tvEM8h8k0SC7Z2uTEXO+9G7gHq4QnR8+nNOQhmac2n6iyv5bfxPTv+iudbxbyX0LXFzhxaaeEGkxRLsrl2TQ=
X-Received: by 2002:a5b:b06:0:b0:6dd:6382:90c with SMTP id z6-20020a5b0b06000000b006dd6382090cmr4828354ybp.636.1668739027644;
 Thu, 17 Nov 2022 18:37:07 -0800 (PST)
MIME-Version: 1.0
References: <20221117062152.3029018-1-cuigaosheng1@huawei.com>
 <f12a5dbe-4626-f6c7-236b-30bb16be1dd6@quicinc.com> <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
In-Reply-To: <99d3aee6-ba3e-5333-6f79-ddbcfc0e8843@amd.com>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Thu, 17 Nov 2022 18:36:56 -0800
Message-ID: <CABdmKX1UMB0L0PmHB59nijReZef6LUQ3XKXitHZo2YnUrJTz9Q@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix possible UAF in dma_buf_export
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Charan Teja Kalla <quic_charante@quicinc.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        sumit.semwal@linaro.org, Dan Carpenter <dan.carpenter@oracle.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 17, 2022 at 2:16 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 17.11.22 um 08:48 schrieb Charan Teja Kalla:
> > Sometime back Dan also reported the same issue[1] where I do mentioned
> > that fput()-->dma_buf_file_release() will remove it from the list.
> >
> > But it seems that I failed to notice fput() here calls the
> > dma_buf_file_release() asynchronously i.e. dmabuf that is accessed in
> > the close path is already freed. Am I wrong here?
> >
> > Should we have the __fput_sync(file) here instead of just fput(file)
> > which can solve this problem?
> >
> > [1]https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lore.kernel.org%2Fall%2F20220516084704.GG29930%40kadam%2F&amp;data=3D05%7C0=
1%7Cchristian.koenig%40amd.com%7C115292dd7a874278b3ed08dac8701320%7C3dd8961=
fe4884e608e11a82d994e183d%7C0%7C0%7C638042680960627756%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C30=
00%7C%7C%7C&amp;sdata=3DNYNIAJjt%2FSUXoc3wCz2vPvo%2Be%2FIVcABEA2JYZ8%2F2q04=
%3D&amp;reserved=3D0
>
> That doesn't look like the right solution to me either.
>
> Essentially we have two separate tear down methods for the dma_buf
> object here:
>
> 1. It's not completely initialized and we can call kfree()+module_put()
> to clean up.
>      There is actually a dma_resv_fini() here. That should probably be
> fixed.
>
> 2. The dma_buf object is fully initialized, but creating the sysfs stats
> file failed.
>      In this case we should *not* clean it up like we currently do, but
> rather call fput().
>
> So the right thing to do is a) fix the missing dma_resv_fini() call and
> b) drop the setting d_fsdata=3DNULL hack and properly return after the fp=
ut().
>
This looks right to me if by properly return you mean return
ERR_PTR(ret); at the end of err_sysfs after the fput. (letting
dma_buf_file_release and dma_buf_release do the full cleanup)

If we still want to avoid calling dmabuf->ops->release(dmabuf) in
dma_buf_release like the comment says I guess we could use sysfs_entry
and ERR_PTR to flag that, otherwise it looks like we'd need a bit
somewhere.

 >
> Regards,
> Christian.
>
> >
> > Thanks,
> > Charan
> > On 11/17/2022 11:51 AM, Gaosheng Cui wrote:
> >> Smatch report warning as follows:
> >>
> >> drivers/dma-buf/dma-buf.c:681 dma_buf_export() warn:
> >>    '&dmabuf->list_node' not removed from list
> >>
> >> If dma_buf_stats_setup() fails in dma_buf_export(), goto err_sysfs
> >> and dmabuf will be freed, but dmabuf->list_node will not be removed
> >> from db_list.head, then list traversal may cause UAF.
> >>
> >> Fix by removeing it from db_list.head before free().
> >>
> >> Fixes: ef3a6b70507a ("dma-buf: call dma_buf_stats_setup after dmabuf i=
s in valid list")
> >> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> >> ---
> >>   drivers/dma-buf/dma-buf.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >> index b809513b03fe..6848f50226d5 100644
> >> --- a/drivers/dma-buf/dma-buf.c
> >> +++ b/drivers/dma-buf/dma-buf.c
> >> @@ -675,6 +675,9 @@ struct dma_buf *dma_buf_export(const struct dma_bu=
f_export_info *exp_info)
> >>      return dmabuf;
> >>
> >>   err_sysfs:
> >> +    mutex_lock(&db_list.lock);
> >> +    list_del(&dmabuf->list_node);
> >> +    mutex_unlock(&db_list.lock);
> >>      /*
> >>       * Set file->f_path.dentry->d_fsdata to NULL so that when
> >>       * dma_buf_release() gets invoked by dentry_ops, it exits
>
