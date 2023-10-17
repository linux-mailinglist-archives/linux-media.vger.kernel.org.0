Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388847CBCE7
	for <lists+linux-media@lfdr.de>; Tue, 17 Oct 2023 09:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234642AbjJQH4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Oct 2023 03:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjJQH4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Oct 2023 03:56:37 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9171193
        for <linux-media@vger.kernel.org>; Tue, 17 Oct 2023 00:56:36 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net [185.9.10.242])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4S8mX05TxTz49Q5T;
        Tue, 17 Oct 2023 10:56:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1697529393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9iOvkUt/O4JFIQq6fWlLU8YisvkXY/lziZivTgp10Cw=;
        b=YQmNhW6nvePM3PL1Mgd98xeE6tZIpDhVCprQ+CMDc+ONdicnGUPEXkbh2+od/04Yo/QKhI
        ad3CEMjRMDl/3fi/b2fHdYRZtMyftLfHBJW9/K5NRN/FqVsBg4opsiMl10IqoKRUWNr/tW
        gUw/8vwPS0bgPuRohNsRp+kyZhZ5/cMf07DGonXjPjHa5GksZNtQeWM+S3v1RdNF2y7T4B
        suS3VNkAVqdFcF6ZtffnA+5vuz8i74jQoEH8EmDZs0a5sAeZllUZ7FNAvylFFDFbWgsyeN
        FA18CAJHByE1ThMy3dn8LldhhZrTdCfOb8nR3mhcEXVi+UJpPESnXjgX0sX+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1697529393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9iOvkUt/O4JFIQq6fWlLU8YisvkXY/lziZivTgp10Cw=;
        b=IzhZLpv/NEvrqv8S/i22zuPk+ZQOPDcmQ+1FlFcnMOmLXLa9ALtG4K+0Ym5SciD+BsU5lK
        p9BWcKowwYU81eJxLMTLwP0ValBkDpla2GF+DJVvFXjiKHmab8SDE6JU/G7tDZBH3y0svq
        tNxBUG8SachvYORNLUhp7iw5dw9fTrG5yoppI1g/OOG45fVfZGwRlR7FyZhme1Z2/4IlhO
        y4jsBW3EJ602OakLpN8N5p9hokAfeSrSQdXov9QXXUYUYqxAN+S9hS/ASrw2eUuRS8HvJC
        KoWa5+u02PdJuiTewWCaLP51RDJmU+Fd4C23lMv2By9vxYELAv8GJvnoo2wYdQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1697529393; a=rsa-sha256;
        cv=none;
        b=pS1KfXkMZB/bytSZsTwGmi2UEkBxvgqcSD//WjM3DvxB041egLf+Z2dXdr08jK/dDb/J6C
        FcW0iOOBmFEopSF+WJtQF2AVL5dI20RFxzsso0ip4VCLQ1/2p+JTDt0XMlaIeRLAUtpnlG
        O0xQZvr3W/bamZ+KF01JsZt7sOvGdC14UW5Dgo1YwTSxttDuwO0/nUsRJ0NNhzlABBubIz
        9tvcV4L5iUS7uwAQUbO4x3SBiWtewu/qY4vOb5y0jL4gt/TbBuqDM20R6OHrX/v4QbLw8n
        eU2NgVBNZFJRv+rWxirMnkqiRNYhGHd4UgMO4j4ks00PrddNyk5dkKW2y4zurA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B79EA634CBF;
        Tue, 17 Oct 2023 10:56:28 +0300 (EEST)
Date:   Tue, 17 Oct 2023 07:56:28 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 6.7] CSI2RX, mostly camera sensor sensor patches
Message-ID: <ZS4+LOmNMzI/HlZv@valkosipuli.retiisi.eu>
References: <ZSaXrKkhP4AOH+Rh@valkosipuli.retiisi.eu>
 <oke7s4zbyy4kmou6v2jm3hl7zap47t2b3rb5d7zscjttakpn6t@vpan6qdzqytc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oke7s4zbyy4kmou6v2jm3hl7zap47t2b3rb5d7zscjttakpn6t@vpan6qdzqytc>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai,

On Tue, Oct 17, 2023 at 01:20:56PM +0530, Jai Luthra wrote:
> Hi Sakari, Hans, Mauro,
> 
> On Oct 11, 2023 at 12:40:12 +0000, Sakari Ailus wrote:
> > Hi Hans, Mauro,
> > 
> > Here's another set of patches for 6.7. Included are, in particular:
> > 
> > - DT binding improvements by Jacopo,
> > - Pratyush's nand Jai's CSI2RX driver
> 
> I have posted two minor fixes for warnings reported by Intel LKP bot 
> introduced by my CSI series.
> 
> 1. https://lore.kernel.org/linux-media/20231013-maintainers_path-v1-1-e28bdcc96ef2@ti.com/
> 2. https://lore.kernel.org/linux-media/20231017-cdns_phy_config-v1-1-583243d1c187@ti.com/
> 
> Hopefully these can be applied before the PR is sent out for 6.7-rc1.

I'll pick these later today.

-- 
Sakari Ailus
