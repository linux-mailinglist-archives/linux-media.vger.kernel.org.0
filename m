Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5645507B7
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 02:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiFSA3B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 20:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSA27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 20:28:59 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85C8B1C0
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 17:28:58 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E05C584011;
        Sun, 19 Jun 2022 02:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655598536;
        bh=L688duDzXEa9xnbGTBtYRkLTDrVbLjKIzgi9IUpo/50=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gGDtv0wrkJpCBoI1CxxeJOjlRL/KLImh+O5LD/I1UuOBktvyHSElbefENKoWF+amw
         SMAHvbSQ2EkwpqDZrb5lq0lYWe8JFHfLlx7Zb7CQ/w+Ybg97b96JUQIyU682DNMAZ9
         asqNrvIwUb57JhPc00On6b3IAzCXGFRLdIYoxfQy1g3IPDrXvYPc8dfehniGSi05RC
         aOeoZ8hX+/Y/Zsn91jA+hwASwnkCl9Sbn9YOddsdFOI63zNnHm2j/ESlN/G8DZduOp
         YrrN+M977z1C6My9KYhNnXOAp2OcuGJtwSnq7CwyLuzHdPof164vIQG7K/bpCGkEY8
         8BnXxMfg6dSyA==
Message-ID: <4dc7b39c-35cd-663a-98f8-6034693df3c8@denx.de>
Date:   Sun, 19 Jun 2022 02:28:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: stm32: dcmi: Register V4L2 subdev nodes
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20220618222335.478205-1-marex@denx.de>
 <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Yq5dtc3MHz5gp5BK@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/19/22 01:20, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Sun, Jun 19, 2022 at 12:23:35AM +0200, Marek Vasut wrote:
>> Unless the V4L2 device calls v4l2_device_register_subdev_nodes(),
>> the /dev/v4l-subdev* sub-device nodes are not registered and thus
>> not created. Add the missing call.
> 
> This driver configures the subdevs internally. Exposing the subdev nodes
> to userspace would conflict with driver operation.
> 
> If you need the subdev nodes only to query subdev information, you can
> use v4l2_device_register_ro_subdev_nodes(). Ideally I'd prefer this
> driver to expose subdev nodes to userspace and stop propagating formats
> internally, but that may break applications :-(

I need those subdevs to configure e.g. test pattern on the sensor side.
