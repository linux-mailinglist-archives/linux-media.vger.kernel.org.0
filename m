Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6056B2443
	for <lists+linux-media@lfdr.de>; Thu,  9 Mar 2023 13:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjCIMg2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Mar 2023 07:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjCIMg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Mar 2023 07:36:26 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BF6EDB64
        for <linux-media@vger.kernel.org>; Thu,  9 Mar 2023 04:36:25 -0800 (PST)
Received: from hillosipuli.retiisi.eu (82-181-192-243.bb.dnainternet.fi [82.181.192.243])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4PXTFM64Gjz49Q1v;
        Thu,  9 Mar 2023 14:36:23 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1678365384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LVeYaVk+e536IkPO1JM3+ifA78jwwRhshbkGregUoaI=;
        b=Gy/yEv0kS0SCSb8ZjChyuiJSBT5tzvaslxUxjzN71shecU2nExch7HZqSOKh/1uJZoIA3e
        +Wfo7N5kfTZsbKoViCh/ksHQc69e3US3stWLlToTwEcWgvHVzuNxZbrA02Qrtiy7n9ybkO
        EMlEUB2hZeHMe7ZGTNqUh1StDSs+n1ApLJHYk17YcsCLO+z5FvGvmtatcQFbPLg+/q9HFp
        QAtcg1VvJZBcSFU0ZscAUcIdkVMMYimhGJgyapS1K2B5XsBMW+vbl1nQSFJZxPczNRtoL9
        6jIZgJiGD34yC1sGtio5XxtUGY+ElTUMlQuQ9DoA3/BJqQ6ENZ3/ANTADo5W7g==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1678365384; a=rsa-sha256;
        cv=none;
        b=VMjJzO1GNbx2NL9BBwHEYirJ8xVcqYauoSCczd1M0H2diuxXGckXaMRfdbacwlkmBo6nWL
        gfBLIyiG4k6ohW7GuA0r4AUz5XuLb0btr6B6Yz9DuaC8yjMZ3+VzlUSZMGa5UCxnk+kKFO
        qU8aI7eWQKSZWCmYCOkKXyY9NMaOn8RckUn8EoSTt7L/zFw7/XAbFwTb9l+iNV8kGIOzqi
        Gwn3fYx6Wrl4Oq0NHLi0egjXQ7hPmgwYmSxBBc+IJpcsQxSi0vmru+FIdF8lH8z1AI6Wcn
        ScztQ5qJpikTFJsyyswY34+pcrgKewwzKrLVO+YGreTpnvsXtz5M4P8XnUiGoQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1678365384;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LVeYaVk+e536IkPO1JM3+ifA78jwwRhshbkGregUoaI=;
        b=NgXlF7MNPVOKEOfpq9Qf+t3VjUwHPjydtEQV0gsnKTjQlIHhDWP2PeJaz5SfQ3Ae+UixDd
        wT/Zwh8lQeqIO1nf1AFQglxkmHc0g4UUiePkRZ7CTMLz/ZGSfUG5QlWMD/H7e9FCrWUP0A
        2Ptsa3UK5/cVA62GgcSvV1S/3Uw5MNPPL7/4+PsXbeLEt4ButF3Qu72IaBIBYuQXA8uOxp
        76512d24VkW0qPqQFZqnUmBG7egxZ59Q0PA2yiwGVBczqq+Eq1s6XpcHGzOFe3zyXNT+9Y
        3zBuou07nzeuaW3mPUZbzggtdlp+FkYIwCxIY/nCU/fkjJHVz3DgTGr2+M897A==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E3CCF634C91;
        Thu,  9 Mar 2023 14:35:43 +0200 (EET)
Date:   Thu, 9 Mar 2023 14:35:43 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, hdegoede@redhat.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 1/1] media: v4l: subdev: Make link validation safer
Message-ID: <ZAnSnzqm3LHf/AGv@valkosipuli.retiisi.eu>
References: <20230309122716.1624141-1-sakari.ailus@linux.intel.com>
 <93679d76-1817-f9b9-3683-f96de55dc13d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93679d76-1817-f9b9-3683-f96de55dc13d@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 09, 2023 at 02:34:28PM +0200, Tomi Valkeinen wrote:
> I think this is supposed to be v2. You missed my RB, but here it is again:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Also, the commit message says "debug message", but it's a warn now.

Thanks, I'll address this while applying it.

-- 
Sakari Ailus
