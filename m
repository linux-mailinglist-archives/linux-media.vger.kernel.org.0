Return-Path: <linux-media+bounces-61762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cACIJQJeB2pa0QIAu9opvQ
	(envelope-from <linux-media+bounces-61762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:55:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1795A555B38
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 19:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9AF9314250F
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E26B4DB579;
	Fri, 15 May 2026 16:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnufnKRZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73513BFAD4;
	Fri, 15 May 2026 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778864285; cv=none; b=Te0++CG79iaZBPGHlPBRkpsrC0gZ/L9gY/uJRSDGr0QHBgdiOe5BcRclv6thsH4fp/qQm+VrQMJ86wmmNcoaJnun3qBIM95lht7JRViJK41t1VhwaFsx3eJiNPSC8ewmf597xUyB30Dd3JSx0tb4zsKaAuddRpv4WTjDMd3/OVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778864285; c=relaxed/simple;
	bh=2z5dLIWyL/gV1rAo31oirSt/RVWW0XQ4DifQczJePGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgNPqKE5fv05x0Sra9ZYGtUhBTVGv9CA+h5Gg6ATi8bO0j3/r03LLckbRZTh2P2IvCGf88BGUu3WAGs+G5XXgCuNjz2Aezb8aSXfQOmaI3kwKVncKPWBv7xzV00XKbES0hZknBi9BHnniMB3IaA1OhNjw3jieXgm5yAP3+0Wc2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnufnKRZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE8AC2BCB3;
	Fri, 15 May 2026 16:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778864283;
	bh=2z5dLIWyL/gV1rAo31oirSt/RVWW0XQ4DifQczJePGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnufnKRZfSdE7NKiVIkh8SzMZ2amgPWr0mdJncaBe+aG4KWO/zp+vLxAajbedi7FS
	 b0zrl4MVSTnTtguuW9Ns0M+VFlzwwLo3mG2DkbaeExbvnlsaSNWLOQdhX8hQzbZo/Y
	 lrM699UVFIkjtTtEEKz4+o4n/y9ZJVRdTKvoesVlNAeQmjXNWiSyWcPuXYQVCCnF/r
	 kDZx/6/JrTSufawkMoMXxYUpVZj8M34oR9RtwMweLiVt+Tp2KPyYemeBpW8ecASvQU
	 RBXPYe6XMGQezQvP2wa+/fslwbs1mVIqj4dyikM619smxSRzaHRitYfR4vTpqNqohH
	 fE+JrFZQ5w45w==
Date: Fri, 15 May 2026 22:27:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 5/9] PCI: tegra: Explicitly specify PMC instance to use
Message-ID: <5gtqxwkjw6adv65tz7ji5wxdyscqe5zlk2ugkogrsrnwituhhm@f3iaamhyxdcm>
References: <20260506-pmc-v1-0-a6de5da7216b@nvidia.com>
 <20260506-pmc-v1-5-a6de5da7216b@nvidia.com>
 <rt3tpcu7eucylbxurtvraghnyljkv52zau75jwkkbtyfslc2ox@2bjkryjd4nqp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rt3tpcu7eucylbxurtvraghnyljkv52zau75jwkkbtyfslc2ox@2bjkryjd4nqp>
X-Rspamd-Queue-Id: 1795A555B38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61762-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,redhat.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,google.com,intel.com,linuxfoundation.org,pengutronix.de,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 10:26:12PM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 06, 2026 at 03:41:56PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Currently the kernel relies on a global variable to reference the PMC
> > context. Use an explicit lookup for the PMC and pass that to the public
> > PMC APIs.
> > 
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/pci/controller/pci-tegra.c | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> > index 512309763d1f..2c6c521e6901 100644
> > --- a/drivers/pci/controller/pci-tegra.c
> > +++ b/drivers/pci/controller/pci-tegra.c
> > @@ -340,6 +340,8 @@ struct tegra_pcie {
> >  	struct reset_control *afi_rst;
> >  	struct reset_control *pcie_xrst;
> >  
> > +	struct tegra_pmc *pmc;
> > +
> >  	bool legacy_phy;
> >  	struct phy *phy;
> >  
> > @@ -1165,7 +1167,7 @@ static void tegra_pcie_power_off(struct tegra_pcie *pcie)
> >  	clk_disable_unprepare(pcie->afi_clk);
> >  
> >  	if (!dev->pm_domain)
> > -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> > +		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
> >  
> >  	err = regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
> >  	if (err < 0)
> > @@ -1183,7 +1185,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
> >  	reset_control_assert(pcie->pex_rst);
> >  
> >  	if (!dev->pm_domain)
> > -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> > +		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
> >  
> >  	/* enable regulators */
> >  	err = regulator_bulk_enable(pcie->num_supplies, pcie->supplies);
> > @@ -1191,12 +1193,14 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
> >  		dev_err(dev, "failed to enable regulators: %d\n", err);
> >  
> >  	if (!dev->pm_domain) {
> > -		err = tegra_powergate_power_on(TEGRA_POWERGATE_PCIE);
> > +		err = tegra_pmc_powergate_power_on(pcie->pmc,
> > +						   TEGRA_POWERGATE_PCIE);
> >  		if (err) {
> >  			dev_err(dev, "failed to power ungate: %d\n", err);
> >  			goto regulator_disable;
> >  		}
> > -		err = tegra_powergate_remove_clamping(TEGRA_POWERGATE_PCIE);
> > +		err = tegra_pmc_powergate_remove_clamping(pcie->pmc,
> > +							  TEGRA_POWERGATE_PCIE);
> >  		if (err) {
> >  			dev_err(dev, "failed to remove clamp: %d\n", err);
> >  			goto powergate;
> > @@ -1234,7 +1238,7 @@ static int tegra_pcie_power_on(struct tegra_pcie *pcie)
> >  	clk_disable_unprepare(pcie->afi_clk);
> >  powergate:
> >  	if (!dev->pm_domain)
> > -		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
> > +		tegra_pmc_powergate_power_off(pcie->pmc, TEGRA_POWERGATE_PCIE);
> >  regulator_disable:
> >  	regulator_bulk_disable(pcie->num_supplies, pcie->supplies);
> >  
> > @@ -1432,6 +1436,12 @@ static int tegra_pcie_get_resources(struct tegra_pcie *pcie)
> >  		return err;
> >  	}
> >  
> > +	pcie->pmc = devm_tegra_pmc_get(dev);
> > +	if (IS_ERR(pcie->pmc)) {
> > +		dev_err_probe(dev, PTR_ERR(pcie->pmc), "failed to get PMC\n");
> > +		return err;
> 
> As Sashiko pointed out, you need to return dev_err_probe() directly.
> 

With the change,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

Feel free to take it through Tegra tree.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

