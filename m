Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661313CB542
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 11:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhGPJbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 05:31:08 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52552 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbhGPJbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 05:31:07 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 42CFE1FE8B;
        Fri, 16 Jul 2021 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1626427692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Cp3iI/FeTKVTMDdHAVYBfn6oSpeqLceHGqZglsJJ2Sg=;
        b=YxxObQMPmvyp94uaMpucyTdBcXWFv+7SmJSO9vUHpubHkcSmXSaR410WmH6c8C3jcTkZQS
        GPUimwpfzumOFnBSKj7u4bITbYBupBCmk8AGVtaDx1K1XlmDS/8GHaVgfnEkhYECdILQmQ
        T664SnftDK61kxF6Sze0ksq//3PXoUs=
Received: from suse.cz (unknown [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 9713EA3BB0;
        Fri, 16 Jul 2021 09:28:11 +0000 (UTC)
Date:   Fri, 16 Jul 2021 11:28:11 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>
Subject: Re: [PATCH v2] media: firewire: firedtv-avc: fix a buffer overflow
 in avc_ca_pmt()
Message-ID: <YPFRK1doifLSwnV3@alley>
References: <YHaulytonFcW+lyZ@mwanda>
 <20210607152348.GX1955@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607152348.GX1955@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 2021-06-07 18:23:48, Dan Carpenter wrote:
> The bounds checking in avc_ca_pmt() is not strict enough.  It should
> be checking "read_pos + 4" because it's reading 5 bytes.  If the
> "es_info_length" is non-zero then it reads a 6th byte so there needs to
> be an additional check for that.
> 
> I also added checks for the "write_pos".  I don't think these are
> required because "read_pos" and "write_pos" are tied together so
> checking one ought to be enough.  But they make the code easier to
> understand for me.  The check on write_pos is:
> 
> 	if (write_pos + 4 >= sizeof(c->operand) - 4) {
> 
> The first "+ 4" is because we're writing 5 bytes and the last " - 4"
> is to leave space for the CRC.
> 
> The other problem is that "length" can be invalid.  It comes from
> "data_length" in fdtv_ca_pmt().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Luo Likang <luolikang@nsfocus.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I do not see this fix in 5.14-rc1. Has it been solved another
way in the end, please?

Best Regards,
Petr
