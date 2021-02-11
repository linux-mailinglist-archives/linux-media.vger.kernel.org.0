Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 450C2318D7C
	for <lists+linux-media@lfdr.de>; Thu, 11 Feb 2021 15:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbhBKOfZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Feb 2021 09:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbhBKOdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Feb 2021 09:33:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F590C0613D6
        for <linux-media@vger.kernel.org>; Thu, 11 Feb 2021 06:32:39 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lAD1G-0008Ve-Le; Thu, 11 Feb 2021 15:32:34 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lAD1F-0006r5-Kf; Thu, 11 Feb 2021 15:32:33 +0100
Date:   Thu, 11 Feb 2021 15:32:33 +0100
From:   Philipp Zabel <pza@pengutronix.de>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG REPORT] media: coda: mpeg4 decode corruption on i.MX6qp only
Message-ID: <20210211143233.GA1360@pengutronix.de>
References: <20210203163348.30686-1-TheSven73@gmail.com>
 <804285cff81878a2c188d1b823182114f891ca38.camel@ndufresne.ca>
 <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGngYiWt9Q4jWksiniC6vqUw29L3mOFuQpw7Dz_BK9Ye9FbQ1Q@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:17:42 up 71 days,  2:44, 112 users,  load average: 0.11, 0.12,
 0.21
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sven,

On Wed, Feb 10, 2021 at 01:29:29PM -0500, Sven Van Asbroeck wrote:
> Found it!
> 
> The i.MX6QuadPlus has two pairs of PREs, which use the extended
> section of the iRAM. The Classic does not have any PREs or extended
> iRAM:
> 
> pre1: pre@21c8000 {
>    compatible = "fsl,imx6qp-pre";
>     <snip>
>     fsl,iram = <&ocram2>;
> };
> 
> pre3: pre@21ca000 {
>     compatible = "fsl,imx6qp-pre";
>     <snip>
>     fsl,iram = <&ocram3>;
> };
> 
> The CODA (VPU) driver uses the common section of iRAM:
> 
> vpu: vpu@2040000 {
>     compatible = "cnm,coda960";
>     <snip>
>     iram = <&ocram>;
> };
> 
> The VPU or the PREs are overrunning their assigned iRAM area. How do I
> know? Because if I change the PRE iRAM order, the problem disappears!
> 
> PRE1: ocram2 change to ocram3
> PRE2: ocram2 change to ocram3
> PRE3: ocram3 change to ocram2
> PRE4: ocram3 change to ocram2

Thank you for debugging this. Given that CODA uses the OCRAM address
range 0x900000-0x940000 and the PREs use OCRAM2 at 0x940000-0x960000
and OCRAM3 at 0x960000-0x980000, it seems unlikely that the PREs would
overrun into the CODA iRAM. But maybe there is some stride related
overflow that causes it to write at negative offsets or some other kind
of oversight.

Could you check /sys/kernel/debug/dri/?/state while running the error case?

Another thing that might help to identify who is writing where might be to
clear the whole OCRAM region and dump it after running only decode or only
PRE/PRG scanout, for example:

----------8<----------
/* Clear OCRAM */
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#define OCRAM_START	0x900000
#define OCRAM_SIZE	0x80000

int main(int argc, char *argv[])
{
	int fd = open("/dev/mem", O_RDWR | O_SYNC);
	void *map = mmap(NULL, OCRAM_SIZE, PROT_WRITE, MAP_SHARED, fd, OCRAM_START);
	if (map == MAP_FAILED)
		return EXIT_FAILURE;
	memset(map, 0, OCRAM_SIZE);
	munmap(map, OCRAM_SIZE);
	close(fd);
	return EXIT_SUCCESS;
}
---------->8----------

----------8<----------
/* Dump OCRAM to stdout */
#include <fcntl.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>

#define OCRAM_START	0x900000
#define OCRAM_SIZE	0x80000

int main(int argc, char *argv[])
{
	int fd = open("/dev/mem", O_RDONLY | O_SYNC);
	void *map = mmap(NULL, OCRAM_SIZE, PROT_READ, MAP_SHARED, fd, OCRAM_START);
	if (map == MAP_FAILED)
		return EXIT_FAILURE;
	write(1, map, OCRAM_SIZE);
	munmap(map, OCRAM_SIZE);
	close(fd);
	return EXIT_SUCCESS;
}
---------->8----------

regards
Philipp
