Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C553E7C1F
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 17:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242747AbhHJP0n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 11:26:43 -0400
Received: from lahtoruutu.iki.fi ([185.185.170.37]:35818 "EHLO
        lahtoruutu.iki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240233AbhHJP0m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 11:26:42 -0400
Received: from hillosipuli.retiisi.eu (89-27-100-251.bb.dnainternet.fi [89.27.100.251])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 071EF1B00162;
        Tue, 10 Aug 2021 18:26:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1628609177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c+kvq1gy7WwWeJiBglGEqXPR7h0W2guoBaK9eFzIKAM=;
        b=jXTE+u0vm7HkcZoYfOH2uIeR8mxcaNu99QweBiJ67lLgMJwdCT5CVWWD6bZpxWykJE3sbE
        tsPhRJrDFW2r2VVw4v5sKpHiWavWxhca7j300XrOr+Pvx2U+va5tPx2ix8k263jaFolHc6
        5u15uYOLnhtuCod7KVbMVYyIbcVHQdBULeXAPPPjdO/jau/x9x/IdtR07Q4r5CANKwMJw6
        LrHd57qBXEx5yihnnxxU+YeU1Bm0quYP+SCJ6dIMrQNBh/s2rRovLCivxYx6GOq0bjNSz5
        WXIPewnUwK+7UyPK/Nts3vRAWV+bE86nXcgcsVJxLtcTMXEBD2fz5c7w4nDc2w==
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A6F9E634C87;
        Tue, 10 Aug 2021 18:24:36 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1mDTdl-00043l-Sd; Tue, 10 Aug 2021 18:26:05 +0300
Date:   Tue, 10 Aug 2021 18:26:05 +0300
From:   "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
To:     Anil Kumar Mamidala <amamidal@xilinx.com>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Message-ID: <20210810152605.GM3@valkosipuli.retiisi.eu>
References: <1627560692-21675-1-git-send-email-anil.mamidala@xilinx.com>
 <SJ0PR02MB851449DED958C023D662E14CB7F19@SJ0PR02MB8514.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ0PR02MB851449DED958C023D662E14CB7F19@SJ0PR02MB8514.namprd02.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1628609177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c+kvq1gy7WwWeJiBglGEqXPR7h0W2guoBaK9eFzIKAM=;
        b=U82QctdUDoyV/I/AYHZLOlIGN6MWL9hBrl7cTBuqRdLgqEiQPAwqGWyrm96agPXSjJKDuM
        8GC375g0ms7/jrLW4mY96fofkJ1vYy2weieBpOpjWnKJS7JsCWQV21GPr+rejqzSovEVPT
        O3AUO994gEPVPcyZ59hk2XYdkPde2JZV6gyi+sev6ZlfKfE+KT99qNPLEkLN6tZssuikoK
        J6TTXDhOBNFOwctn6c0C2Rv8sYFfUgucagm+P8jrLmb7vbGqNV9MutTV+FN6kU9RsHPspt
        XGyJjy3CNrYzrSzq3YF6pibcsC/SF5PwzrQ1n0qV1xNmLNWgO0XTT6a/TC8OXA==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1628609177; a=rsa-sha256;
        cv=none;
        b=unnphLRZZE3o/Np5seebEXOQJb+VBVzvmAc7zV1HwGde3Ghy3mVXEpENCanJkkmkmFFcFl
        aCRYu+gyn+M1dTcVjzVybuw7HEQjc3Jr579a3gj2JJnRN4yW4qsn2IFEK2xG+w7PLgneQx
        guvDfVkqXBsYoLJPvo8RqpvY7oXA/xHe/4mfiFX2kS+hgKx3gXMKqyaHFauZSUSlnguibH
        HEpqw328Y2BY6dvDrrjUCllefO3C/9skgxD/EL7HhM3ITIoc0GFpPDTJMgylFLI0FwPlzK
        yZ4MISEp6dHiBULr73Qdvdvv2O4Mf8Ua/Xw5S/jYdgNPpAQxmSaCMz3o4iQIWQ==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Anil,

On Wed, Aug 04, 2021 at 06:05:54AM +0000, Anil Kumar Mamidala wrote:
> Hi Sakari,
> 
> Can you please review ap1302 ISP driver patch. Sorry for the delay in pushing the changes.

No worries.

Could you elaborate what has changed here since v1?

-- 
Sakari Ailus
