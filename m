Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69E41BEF55
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 06:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgD3Eha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 00:37:30 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:48876 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgD3Eha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 00:37:30 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8A20620025;
        Thu, 30 Apr 2020 06:37:24 +0200 (CEST)
Date:   Thu, 30 Apr 2020 06:37:23 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Vitor Massaru Iha <vitor@massaru.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        dri-devel@lists.freedesktop.org, brendanhiggins@google.com,
        linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Documentation: fix: `make htmldocs` warnings
Message-ID: <20200430043723.GA27272@ravnborg.org>
References: <20200430015930.32224-1-vitor@massaru.org>
 <cb4d93a0-b967-f37d-ea01-0368c91b896e@infradead.org>
 <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0463c90cfbe2036235010c5f8b92af6a96c20f74.camel@massaru.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=DAf_8NmfAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
        a=NxUiqei-aeCDQRDTOOgA:9 a=CjuIK1q_8ugA:10 a=-sleECFk_mc0XVijyva9:22
        a=AjGcO6oz07-iQ99wixmX:22 a=1CNFftbPRP8L7MoqJWF3:22
        a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 29, 2020 at 11:27:22PM -0300, Vitor Massaru Iha wrote:
> On Wed, 2020-04-29 at 19:06 -0700, Randy Dunlap wrote:
> > On 4/29/20 6:59 PM, Vitor Massaru Iha wrote:
> > > Add missed ":" on kernel-doc function parameter.
> > > 
> > > This patch fixes this warnings from `make htmldocs`:
> > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > member 'importer_ops' not described in 'dma_buf_dynamic_attach'
> > > ./drivers/dma-buf/dma-buf.c:678: warning: Function parameter or
> > > member 'importer_priv' not described in 'dma_buf_dynamic_attach'
> > > 
> > > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > > ---
> > >  drivers/dma-buf/dma-buf.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index ccc9eda1bc28..0756d2155745 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -655,8 +655,8 @@ EXPORT_SYMBOL_GPL(dma_buf_put);
> > >   * calls attach() of dma_buf_ops to allow device-specific attach
> > > functionality
> > >   * @dmabuf:		[in]	buffer to attach device to.
> > >   * @dev:		[in]	device to be attached.
> > > - * @importer_ops	[in]	importer operations for the
> > > attachment
> > > - * @importer_priv	[in]	importer private pointer for the
> > > attachment
> > > + * @importer_ops:	[in]	importer operations for the
> > > attachment
> > > + * @importer_priv:	[in]	importer private pointer for the
> > > attachment
> > >   *
> > >   * Returns struct dma_buf_attachment pointer for this attachment.
> > > Attachments
> > >   * must be cleaned up by calling dma_buf_detach().
> > > 
> > 
> > Sumit said that he would be applying my patch from April 7:
> > https://lore.kernel.org/linux-media/7bcbe6fe-0b4b-87da-d003-b68a26eb4cf0@infradead.org/
> > 
> > thanks.
> 
> Sorry. I didn't check if the patch has already been sent.

Sumit - patch from Randy is neither applied to drm-misc-next nor
drm-misc-fixes.
A reminder in case it was lost somewhere.

	Sam
